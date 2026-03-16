import 'package:esfrasoft_interview/app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isPasswordVisible = RxBool(false);

  void validate() {
    if (formKey.currentState!.validate()) {
      navigate();
    }
  }

  void navigate() {
    Get.offAllNamed(AppRoutes.homeRoute);
  }
}
