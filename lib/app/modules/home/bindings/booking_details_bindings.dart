import 'package:esfrasoft_interview/app/modules/home/controller/booking_details_controller.dart';
import 'package:get/get.dart';

class BookingDetailsBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => BookingDetailsController());
  }
}
