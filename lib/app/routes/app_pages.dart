import 'package:esfrasoft_interview/app/modules/auth/bindings/auth_bindings.dart';
import 'package:esfrasoft_interview/app/modules/home/bindings/booking_details_bindings.dart';
import 'package:esfrasoft_interview/app/modules/home/bindings/home_bindings.dart';
import 'package:esfrasoft_interview/app/modules/home/view/booking_details_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/auth/view/auth_screen.dart';
import '../modules/home/view/home_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.authRoute,
      page: () => AuthScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRoutes.homeRoute,
      page: () => HomeScreen(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: AppRoutes.bookingDetailsRoute,
      page: () => BookingDetailsScreen(),
      binding: BookingDetailsBindings(),
    ),
  ];
}
