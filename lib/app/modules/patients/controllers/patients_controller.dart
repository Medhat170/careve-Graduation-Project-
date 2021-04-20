import 'package:careve/app/mixins/api_mixin.dart';
import 'package:careve/app/mixins/app_bar_mixin.dart';
import 'package:careve/app/mixins/busy_mixin.dart';
import 'package:get/get.dart';

class PatientsController extends GetxController
    with CustomAppBar, BusyMixin, ApiMixin {}
