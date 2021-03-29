import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:careve/app/utilities/pathUtil.dart';
import 'package:careve/generated/l10n.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

mixin ApiMixin {
  var _dio = Dio();
  var _formData = FormData();

  Future<Map<String, dynamic>> post({
    @required String url,
    @required Map<String, dynamic> body,
    Map<String, dynamic> header,
    Map<String, List<File>> files,
    int sendTimeout,
    int receiveTimeout,
    Function(int count, int total) onSendProgress,
    Function(int count, int total) onReceiveProgress,
  }) async {
    _formData = FormData();
    _addBody(body ?? {});
    _addFiles(files ?? {});
    return (await request(
      _dio.post(
        url,
        data: _formData,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        options: Options(
          headers: header,
          receiveTimeout: receiveTimeout,
          sendTimeout: sendTimeout,
        ),
      ),
    ));
  }

  Future get({
    @required String url,
    @required Map<String, dynamic> header,
    int sendTimeout,
    int receiveTimeout,
    Function(int count, int total) onReceiveProgress,
  }) async {
    return (await request(
      _dio.get(
        url,
        onReceiveProgress: onReceiveProgress,
        options: Options(
          headers: header,
          receiveTimeout: receiveTimeout,
          sendTimeout: sendTimeout,
        ),
      ),
    ));
  }

  void _addBody(Map<String, dynamic> data) {
    if (data != null) {
      _formData.fields
        ..addAll(
          data.entries.map(
            (element) => MapEntry(
              element?.key,
              element?.value,
            ),
          ),
        );
    }
  }

  void _addFiles(Map<String, List<File>> files) {
    if (files != null ||
        files?.entries != null ||
        files?.entries?.length != 0) {
      for (var entry in files?.entries) {
        if (entry?.value != null || entry?.value?.length != 0) {
          _formData.files.addAll(
            entry.value.map(
              (e) => MapEntry(
                entry?.key,
                MultipartFile.fromFileSync(
                  e?.path,
                  filename: e?.path?.split("/")?.last,
                ),
              ),
            ),
          );
        }
      }
    }
  }

  String _errorMsg(dynamic error) {
    var errorMessage = S.current.formatException;
    try {
      if (error?.entries != null) {
        for (var error in error?.entries) {
          if (error?.value is String) {
            errorMessage = ' $errorMessage  ${error?.value} ';
          } else if (error?.value is List) {
            errorMessage = ' $errorMessage  -${error?.value[0]} \n ';
          }
        }
      }
    } catch (e) {
      errorMessage = error.toString();
    }
    return errorMessage;
  }

  Future<Map<String, dynamic>> request(
    Future<Response> future,
  ) async {
    try {
      final data = (await future);

      final Map<String, dynamic> response = json.decode(data.toString());
      print('Response : ${data.toString()}');
      return response;
    } on DioError catch (dioError) {
      String errorMessage;
      if (dioError.type == DioErrorType.connectTimeout ||
          dioError.type == DioErrorType.receiveTimeout ||
          dioError.type == DioErrorType.sendTimeout) {
        errorMessage = S.current.socketException;
      } else if (dioError.type == DioErrorType.cancel) {
        errorMessage = S.current.httpException;
      } else if (dioError.type == DioErrorType.response) {
        switch (dioError.response.statusCode) {
          case 401:
            errorMessage = S.current.unAuthorized;
            break;
          case 400:
            print(":::::::::::::::");
            errorMessage = _errorMsg(dioError.response.data);
            break;
          case 500:
            errorMessage = S.current.formatException;
            break;
          default:
            errorMessage = S.current.formatException;
        }
      }
      throw errorMessage;
    }
  }
}
