import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String image;
  ImageWidget({
    @required this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(
        image,
      ),
    );
  }
}
