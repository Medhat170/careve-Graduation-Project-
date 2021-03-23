
import 'package:careve/generated/l10n.dart';
import 'package:dio/dio.dart' as dio;
mixin ApiMixin {

  Future<T> request<T>(
    Future<dio.Response<T>> future,
  ) async {
    try {
      return (await future).data;
    } on dio.DioError catch (dioError) {
      String errorMessage;
      if (dioError.type == dio.DioErrorType.CONNECT_TIMEOUT ||
          dioError.type == dio.DioErrorType.RECEIVE_TIMEOUT ||
          dioError.type == dio.DioErrorType.SEND_TIMEOUT) {
        errorMessage = S.current.socketException;
      } else if (dioError.type == dio.DioErrorType.CANCEL) {
        errorMessage = S.current.httpException;
      } else if (dioError.type == dio.DioErrorType.RESPONSE) {
        switch (dioError.response.statusCode) {
          case 401:
          case 400:
            errorMessage = dioError.response.data;
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
