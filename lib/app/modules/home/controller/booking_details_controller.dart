import 'package:esfrasoft_interview/app/modules/home/data/BookingItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BookingDetailsController extends GetxController {
  Rxn<BookingItem> bookingItem = Rxn<BookingItem>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _getArguments();
  }

  void _getArguments() {
    final arguments = Get.arguments;
    if (arguments != null && arguments.containsKey("data")) {
      debugPrint("data: ${arguments["data"]}");
      bookingItem.value = arguments["data"] as BookingItem;
    }
  }

  void onChnageValue(String value) {
    if (value == "Complete") {
      bookingItem.value?.status = "Completed";
    } else if (value == "Cancel") {
      bookingItem.value?.status = "Cancelled";
    }
    bookingItem.refresh();

    Get.back(result: bookingItem.value?.status);
  }
}
