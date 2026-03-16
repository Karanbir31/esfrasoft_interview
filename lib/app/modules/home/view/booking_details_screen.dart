import 'package:esfrasoft_interview/app/modules/home/controller/booking_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingDetailsScreen extends GetView<BookingDetailsController> {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Booking Details Screen"), centerTitle: true),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Text(
          controller.bookingItem.value?.title ?? "",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Text(
          "date : ${controller.bookingItem.value?.date}" ?? "",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        Obx(
          () => Text(
            "status : ${controller.bookingItem.value?.status}" ?? "",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        Text(
          "Pick up : ${controller.bookingItem.value?.pickup}" ?? "",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),

        Text(
          "Destination : ${controller.bookingItem.value?.drop}" ?? "",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),

        Visibility(
          visible:
              controller.bookingItem.value?.status?.toLowerCase() == "booked",
          child: _changeStatus(),
        ),
      ],
    ).marginSymmetric(horizontal: 16);
  }

  Widget _changeStatus() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.grey.shade50, width: 1.0),
        ),
      ),
      hint: Text("Change Status"),

      items: ["Complete", "Cancel"]
          .map((status) => DropdownMenuItem(value: status, child: Text(status)))
          .toList(),
      onChanged: (value) {
        controller.onChnageValue(value!);
      },
    );
  }
}
