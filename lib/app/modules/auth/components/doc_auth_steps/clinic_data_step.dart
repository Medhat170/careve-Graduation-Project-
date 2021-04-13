import 'package:careve/app/modules/auth/components/auth_input_field.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/appUtil.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:careve/app/utilities/validators.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ClinicDataStep extends Step {
  ClinicDataStep({
    bool isActive = false,
    StepState stepState = StepState.editing,
  }) : super(
          title: !isActive
              ? SizedBox.shrink()
              : FittedBox(
                  child: Text(
                    S.current.clinicData,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
          isActive: isActive,
          state: stepState,
          content: Directionality(
            textDirection:
                AppUtil.isLtr ? TextDirection.ltr : TextDirection.rtl,
            child: Form(
              key: AuthService.to.clinicFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AuthInputField(
                    S.current.phoneNumber,
                    AuthService.to.phone,
                    loading: AuthService.to.isBusy.value,
                    keyBoardType: TextInputType.number,
                    validator: QuickTextValidator(
                      isPhone: true,
                    ).call,
                  ),
                  AuthInputField(
                    S.current.address,
                    AuthService.to.address,
                    loading: AuthService.to.isBusy.value,
                    keyBoardType: TextInputType.text,
                    validator: QuickTextValidator().call,
                    suffix: IconButton(
                      icon: Icon(
                        Icons.add_location_alt_rounded,
                        color: AuthService.to.address.text != null &&
                                AuthService.to.address.text.length > 1
                            ? ColorUtil.primaryColor
                            : ColorUtil.errorColor,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        final currentLocation =
                            await AppUtil.getCurrentLocation();
                        final pickedLocation = await Navigator.push<PickResult>(
                          Get.context,
                          MaterialPageRoute(
                            builder: (context) => PlacePicker(
                              apiKey: 'AIzaSyByhDTGyST-Uxd8CxyuOs2TbiakqLJz1y8',
                              onPlacePicked: (result) {
                                print(result);
                                Navigator.of(context).pop(result);
                              },
                              initialPosition: LatLng(
                                currentLocation.latitude,
                                currentLocation.longitude,
                              ),
                              useCurrentLocation: false,
                            ),
                          ),
                        );
                        if (pickedLocation != null) {
                          print(
                            'You picked: ${pickedLocation.formattedAddress}',
                          );
                          AuthService.to.address.text =
                              pickedLocation.formattedAddress;
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
}
