import 'package:careve/app/components/App_Section_item.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../App_Sections_Data.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Careve',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: ColorUtil.primaryColor),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Remember, we\'re here to help you ...',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: ColorUtil.mediumGrey,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GridView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: App_Sections_Data.map((secData) => AppSectionItem(
                      name: secData.name,
                      image: secData.image,
                    )).toList(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1 / 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
