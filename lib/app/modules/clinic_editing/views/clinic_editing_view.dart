import 'package:careve/app/components/animated_list_handler.dart';
import 'package:careve/app/components/app_button.dart';
import 'package:careve/app/components/global_scaffold.dart';
import 'package:careve/app/components/loading.dart';
import 'package:careve/app/mixins/app_bar_mixin.dart';
import 'package:careve/app/modules/auth/components/auth_input_field.dart';
import 'package:careve/app/modules/clinic_editing/components/days_component.dart';
import 'package:careve/app/modules/clinic_editing/controllers/clinic_editing_controller.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/app/utilities/validators.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ClinicEditingView extends GetView<ClinicEditingController>
    with CustomAppBar {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Column(
        children: [
          customAppBar(
            controller.clinicForEdit?.id != null
                ? S.of(context).clinicData
                : S.of(context).addClinic,
            enableBack: true,
          ),
          Expanded(
            child: Obx(
              () {
                print(controller.clinic.value);
                final clinicData = controller.clinic.value;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  child: Form(
                    key: controller.clinicFormKey,
                    child: AnimatedListHandler(
                      children: [
                        AuthInputField(
                          S.current.mark,
                          TextEditingController(
                            text: clinicData?.address?.title,
                          ),
                          loading: controller.isBusy.value,
                          onChanged: (String value) {
                            controller.changeClinicTitle(
                              value,
                            );
                          },
                          validator: const QuickTextValidator().call,
                        ),
                        AuthInputField(
                          S.current.address,
                          TextEditingController(
                            text: clinicData?.address?.formattedAddress,
                          ),
                          loading: true,
                          onChanged: (String value) {
                            controller.changeAddress(
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
                              if (controller.currentLocation == null) {
                                controller.currentLocation(
                                    await AppUtil.getCurrentLocation());
                              }
                              final pickedLocation =
                                  await Navigator.push<PickResult>(
                                Get.context,
                                MaterialPageRoute(
                                  builder: (context) => PlacePicker(
                                    autocompleteLanguage: 'ar',
                                    apiKey:
                                        'AIzaSyByhDTGyST-Uxd8CxyuOs2TbiakqLJz1y8',
                                    onPlacePicked: (result) {
                                      Navigator.of(context).pop(result);
                                    },
                                    initialPosition: LatLng(
                                      controller.currentLocation?.value
                                              ?.latitude ??
                                          31.55555555,
                                      controller.currentLocation?.value
                                              ?.longitude ??
                                          31.55555555,
                                    ),
                                    useCurrentLocation: false,
                                  ),
                                ),
                              );
                              if (pickedLocation != null) {
                                print(
                                  'You picked: ${pickedLocation?.formattedAddress}',
                                );
                                controller.changeAddress(
                                  title: pickedLocation.name,
                                  formattedAddress:
                                      pickedLocation.formattedAddress,
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
                            text: clinicData?.mobile,
                          ),
                          loading: controller.isBusy.value,
                          keyBoardType: TextInputType.number,
                          onChanged: (String value) {
                            controller.changePhone(value);
                          },
                          validator: const QuickTextValidator(
                            isPhone: true,
                          ).call,
                        ),
                        DaysComponents(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        if (controller.isBusy.value)
                          Loading()
                        else
                          CareveButton(
                            title: controller.clinicForEdit?.id != null
                                ? S.of(context).edit
                                : S.of(context).done,
                            onTap: () {
                              if (controller.clinicForEdit?.id != null) {
                                controller.editClinic();
                              } else {
                                controller.addClinic();
                              }
                            },
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
