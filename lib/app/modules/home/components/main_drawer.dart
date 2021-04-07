import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:careve/app/utilities/pathUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: ColorUtil.primaryColor,
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          PathUtil.defaultUserImage,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    'Abdo Rizk',
                    style: TextStyle(
                      fontSize: 60.sp,
                      fontWeight: FontWeight.w700,
                      color: ColorUtil.whiteColor,
                    ),
                  ),
                  Text(
                    'AbdoRizk@gmail.com',
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w700,
                      color: ColorUtil.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          MyListTile(
            icon: Icons.person,
            title: 'My Profile',
            iconColor: ColorUtil.primaryColor,
            function: () => Get.toNamed(Routes.USER_PROFILE),
          ),
          Divider(
            thickness: 1,
          ),
          MyListTile(
            icon: Icons.mail,
            title: 'Messages',
            iconColor: Colors.amber,
            function: null,
          ),
          Divider(
            thickness: 1,
          ),
          MyListTile(
            icon: Icons.save,
            title: 'Saved',
            iconColor: Colors.purple,
            function: null,
          ),
          Divider(
            thickness: 1,
          ),
          MyListTile(
            icon: Icons.settings,
            title: 'Setting',
            iconColor: ColorUtil.mediumGrey,
            function: null,
          ),
          Divider(
            thickness: 1,
          ),
          MyListTile(
            icon: Icons.logout,
            title: 'Log Out',
            iconColor: Colors.deepPurpleAccent,
            function: null,
          ),
          Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconColor;
  final Function function;
  MyListTile(
      {@required this.icon,
      @required this.title,
      this.iconColor,
      this.function});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 40.sp,
        ),
      ),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: function,
    );
  }
}
