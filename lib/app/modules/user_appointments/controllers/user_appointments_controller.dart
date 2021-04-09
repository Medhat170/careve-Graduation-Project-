import 'package:get/get.dart';

class UserAppointmentsController extends GetxController {
  List<DateTime> dates = List.generate(
    7,
    (index) {
      return DateTime.now().add(
        Duration(days: index),
      );
    },
  );

  List<DateTime> get today => dates
      .where(
        (element) =>
            element.day == DateTime.now().day &&
            element.month == DateTime.now().month,
      )
      .toList();

  List<DateTime> get earlier => dates
      .where(
        (element) =>
            element.difference(DateTime.now()).inDays <= 2 &&
            element.difference(DateTime.now()).inDays >= 1,
      )
      .toList();

  List<DateTime> get later => dates
      .where(
        (element) => element.difference(DateTime.now()).inDays > 2,
      )
      .toList();
}
