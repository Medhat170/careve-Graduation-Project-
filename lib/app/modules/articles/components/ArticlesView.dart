import 'package:careve/app/utilities/pathUtil.dart';
import 'package:flutter/material.dart';
import 'ListView_Item.dart';

class ArticlesView extends StatelessWidget {
  final List<Map<String, String>> articlesData = [
    {
      "image": PathUtil.doctorsImage,
      "question": 'What is symptoms and causes of breast cancer?'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(
          20,
        ),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: articlesData.length,
          itemBuilder: (context, index) => ListViewItem(
            image: articlesData[index]["image"],
            question: articlesData[index]["question"],
          ),
        ),
      ),
    );
  }
}
