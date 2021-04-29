import 'package:careve/app/modules/auth/components/auth_input_field.dart';
import 'package:careve/app/modules/auth/components/doc_auth_steps/clinic_data_step/days_component.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/app/utilities/validators.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ClinicComponent extends StatelessWidget {
  final int index;

  const ClinicComponent({
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: AppUtil.borderRadius,
              border: Border.all(
                color: ColorUtil.mediumGrey,
              ),
            ),
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                AuthInputField(
                  S.current.mark,
                  TextEditingController(
                    text: AuthService
                        .to.userClinics.value?.clinics[index]?.address?.title,
                  ),
                  loading: AuthService.to.isBusy.value,
                  onChanged: (String value) {
                    AuthService.to.changeAddress(
                      index,
                      title: value,
                    );
                  },
                  validator: const QuickTextValidator().call,
                ),
                AuthInputField(
                  S.current.address,
                  TextEditingController(
                    text: AuthService.to.userClinics.value?.clinics[index]
                        ?.address?.formattedAddress,
                  ),
                  loading: AuthService.to.isBusy.value,
                  onChanged: (String value) {
                    AuthService.to.changeAddress(
                      index,
                      formattedAddress: value,
                    );
                  },
                  keyBoardType: TextInputType.text,
                  validator: const QuickTextValidator().call,
                  suffix: IconButton(
                    icon: const Icon(
                      Icons.add_location_alt_rounded,
                      color: ColorUtil.primaryColor,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      if (AuthService.to.currentLocation == null) {
                        AuthService.to.currentLocation(
                            await AppUtil.getCurrentLocation());
                      }
                      final pickedLocation = await Navigator.push<PickResult>(
                        Get.context,
                        MaterialPageRoute(
                          builder: (context) => PlacePicker(
                            autocompleteLanguage: 'ar',
                            apiKey: 'AIzaSyByhDTGyST-Uxd8CxyuOs2TbiakqLJz1y8',
                            onPlacePicked: (result) {
                              Navigator.of(context).pop(result);
                            },
                            initialPosition: LatLng(
                              AuthService.to.currentLocation?.value?.latitude ??
                                  31.55555555,
                              AuthService
                                      .to.currentLocation?.value?.longitude ??
                                  31.55555555,
                            ),
                            useCurrentLocation: false,
                          ),
                        ),
                      );
                      if (pickedLocation != null) {
                        print(
                            'You picked: ${pickedLocation?.formattedAddress}');
                        AuthService.to.changeAddress(
                          index,
                          title: pickedLocation.name,
                          formattedAddress: pickedLocation.formattedAddress,
                          lat: pickedLocation.geometry.location.lat,
                          long: pickedLocation.geometry.location.lng,
                        );
                      }
                    },
                  ),
                ),
                AuthInputField(
                  S.current.phoneNumber,
                  TextEditingController(
                    text:
                        AuthService.to.userClinics.value?.clinics[index]?.phone,
                  ),
                  loading: AuthService.to.isBusy.value,
                  keyBoardType: TextInputType.number,
                  onChanged: (String value) {
                    AuthService.to.changePhone(index, value);
                  },
                  validator: const QuickTextValidator(
                    isPhone: true,
                  ).call,
                ),
                DaysComponents(
                  index: index,
                ),
              ],
            ),
          ),
          if (index != 0)
            Positioned(
              top: 0.0,
              right: AppUtil.isLtr ? 0.0 : null,
              left: AppUtil.isLtr ? null : 0.0,
              child: GestureDetector(
                onTap: () => AuthService.to.removeClinic(index),
                child: Icon(
                  Icons.remove_circle,
                  color: ColorUtil.errorColor,
                  size: 22.0,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
