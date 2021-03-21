import 'package:careve/custom_widgets/TextButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/welcome_screen_controller.dart';

class WelcomeScreenView extends GetView<WelcomeScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('images_icons/app_images/hands_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Color.fromRGBO(21, 7, 13, 0.43),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 42, vertical: 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 23),
                  child: Image(
                    image: AssetImage('images_icons/app_icons/icon.png'),
                  ),
                ),
                Text(
                  'careEve',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'fonts/Segoe UI Bold.ttf',
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
                Text(
                  'Welcome...',
                  style: TextStyle(
                      fontSize: 39,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'fonts/Segoe UI Bold.ttf'),
                ),
                Text(
                  'to careEve for breast cancer\nawareness and women\nhealth care.',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'fonts/Segoe UI Bold.ttf',
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                CustomTextButton(
                  textColor: Color(0xFFFFFFFf),
                  text: 'Sign Up',
                  backgroundColor: Color(0xFFFF4493),
                  function: () {},
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextButton(
                  text: 'Sign In',
                  backgroundColor: null,
                  function: () {},
                  textColor: Color(0xFFFF4493),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
