import 'package:flutter/cupertino.dart';

class SelfCheckingData {
  final String title;
  final String highlightTitle;
  final List<String> images;
  final List<String> highlights;
  final List<String> subTitles;

  SelfCheckingData({
    @required this.title,
    @required this.subTitles,
    this.highlights,
    this.highlightTitle,
    this.images,
  });
}
