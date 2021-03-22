import 'package:careve/app/components/SignContainer.dart';
import 'package:careve/app/components/TextButton.dart';
import 'package:careve/app/components/TextField.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/sign_in_controller.dart';
import 'package:careve/app/utilities/pathUtil.dart';

class SignInView extends GetView<SignInController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 27, vertical: 94),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Welcome! to Careve',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFFA2A2A2),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'password',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFFA2A2A2),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextButton(
                      text: 'Sign In',
                      function: () {},
                      backgroundColor: ColorUtil.primaryColor,
                      textColor: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorUtil.primaryColor,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    '-OR-',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomSignInContainer(PathUtil.facebookIcon),
                    CustomSignInContainer(PathUtil.googleIcon),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
