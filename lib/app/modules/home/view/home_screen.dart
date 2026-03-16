import 'package:esfrasoft_interview/app/modules/home/controller/home_controller.dart';
import 'package:esfrasoft_interview/app/modules/home/data/BookingItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen"), centerTitle: true),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _searchWidget().marginOnly(bottom: 20),
        Expanded(child: _bookingList()),
      ],
    ).paddingSymmetric(horizontal: 16);
  }

  Widget _searchWidget() {
    return TextFormField(
      controller: controller.searchController,
      decoration: InputDecoration(
        hint: Text("Search here"),
        suffixIcon: IconButton(
          onPressed: () {
            controller.searchController.clear();
            controller.filteredBookingItems.assignAll(controller.bookingItems);
          },
          icon: Icon(Icons.cancel_rounded),
        ),

        prefixIcon: Icon(Icons.search),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.grey.shade50, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.red.shade50, width: 1.0),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.blue.shade200, width: 1.0),
        ),

        fillColor: Colors.white12,
      ),
      onChanged: (value) {
        controller.onSearch();
      },
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      onFieldSubmitted: (value) {
        controller.onSearch();
      },
    );
  }

  Widget _bookingList() {
    return Obx(
      () => ListView.builder(
        itemBuilder: (context, index) =>
            _bookingCard(controller.filteredBookingItems[index]),
        itemCount: controller.filteredBookingItems.length,
      ),
    );
  }

  Widget _bookingItem(BookingItem booking) {
    return ListTile(
      title: Text(booking.title ?? ""),
      subtitle: Text(booking.date ?? ""),
      trailing: Text(booking.status ?? ""),
      onTap: () => controller.onBookingItemTap(booking),
    );
  }

  Widget _bookingCard(BookingItem booking) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200, width: 1),
      ),
      child: GestureDetector(
        onTap: () => controller.onBookingItemTap(booking),
        behavior: HitTestBehavior.translucent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              booking.title ?? "",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "date: ${booking.date}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: controller.getColorByStatus(booking.status ?? ""),
                  ),
                  child: Text(
                    booking.status ?? "",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ).paddingSymmetric(vertical: 8, horizontal: 8),
                ),
              ],
            ),
          ],
        ).paddingSymmetric(vertical: 16, horizontal: 16),
      ),
    ).marginOnly(bottom: 16);
  }
}
