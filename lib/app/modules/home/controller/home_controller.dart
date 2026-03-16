import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../data/BookingItem.dart';

class HomeController extends GetxController {
  RxList<BookingItem> filteredBookingItems = <BookingItem>[].obs;

  List<BookingItem> bookingItems = [];

  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _getBookingItems();
  }

  void _getBookingItems() {
    jsonData
        .map((item) => bookingItems.add(BookingItem.fromJson(item)))
        .toList();
    filteredBookingItems.assignAll(bookingItems);
    filteredBookingItems.refresh();
  }

  void onSearch() {
    final query = searchController.text.trim().toLowerCase();

    if (query.isEmpty) {
      filteredBookingItems.assignAll(bookingItems);
      filteredBookingItems.refresh();
      return;
    }
    final list = bookingItems
        .where(
          (element) =>
              (element.title!.toLowerCase().contains(query) ||
              element.title!.toLowerCase().startsWith(query)),
        )
        .toList();
    filteredBookingItems.assignAll(list);
    filteredBookingItems.refresh();
  }

  Future<void> onBookingItemTap(BookingItem booking) async {
    final status = await Get.toNamed(
      AppRoutes.bookingDetailsRoute,
      arguments: {"data": booking},
    );

    if (status != null) {
      final index = filteredBookingItems.indexWhere(
        (element) => element.id == booking.id,
      );
      if (index != -1) {
        filteredBookingItems[index].status = status;
        filteredBookingItems.refresh();
      }
    }
  }

  Color getColorByStatus(String status) {
    if (status == "Booked") {
      return Colors.blue;
    } else if (status == "Completed") {
      return Colors.green;
    } else if (status == "Cancelled") {
      return Colors.red;
    }
    return Colors.grey;
  }

  final jsonData = [
    {
      "id": 1,
      "title": "Downtown Seattle to Sea-Tac",
      "date": "2026-01-20",
      "status": "Booked",
      "pickup": "Hotel A",
      "drop": "Sea-Tac",
    },
    {
      "id": 2,
      "title": "Sea-Tac to Downtown Seattle",
      "date": "2026-01-22",
      "status": "Completed",
      "pickup": "Sea-Tac",
      "drop": "Hotel B",
    },
    {
      "id": 3,
      "title": "Private Car: Bellevue to Sea-Tac",
      "date": "2026-01-25",
      "status": "Booked",
      "pickup": "Bellevue",
      "drop": "Sea-Tac",
    },
    {
      "id": 4,
      "title": "Test booking",
      "date": "2026-01-22",
      "status": "Booked",
      "pickup": "Sea-Tac",
      "drop": "Hotel B",
    },
    {
      "id": 5,
      "title": "Private Car: testing booking",
      "date": "2026-01-25",
      "status": "Booked",
      "pickup": "Bellevue",
      "drop": "Sea-Tac",
    },
  ];
}
