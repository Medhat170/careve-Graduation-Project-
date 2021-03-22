import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSignInContainer extends StatelessWidget {
  final String image;
  CustomSignInContainer(this.image);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(10),
        width: 140,
        height: 50,
        decoration: BoxDecoration(
          color: Color.fromRGBO(240, 240, 240, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              image,
              width: 100.w,
              height: 100.w,
            ),
            Text(
              'Sign In',
              style: TextStyle(
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
