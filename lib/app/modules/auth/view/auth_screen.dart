import 'package:esfrasoft_interview/app/modules/auth/controller/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen"), centerTitle: true),

      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(children: [_formWidget()]);
  }

  Widget _formWidget() {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          _emailWidget().marginOnly(bottom: 16),
          _passwordWidget().marginOnly(bottom: 24),
          _loginButton(),
        ],
      ).marginOnly(left: 16, right: 16),
    );
  }

  Widget _emailWidget() {
    return TextFormField(
      controller: controller.emailController,
      decoration: InputDecoration(
        hint: Text("Enter Email"),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.grey.shade50, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.red.shade300, width: 1.0),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.blue.shade300, width: 1.0),
        ),

        fillColor: Colors.white12,
      ),
      validator: (value) {
        if (controller.emailController.text.trim().isEmpty) {
          return 'Please enter email';
        }
        // check of valid email

        if (GetUtils.isEmail(controller.emailController.text.trim()) == false) {
          return 'Please enter valid email';
        }
        return null;
      },

      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  Widget _passwordWidget() {
    return Obx(
      () => TextFormField(
        controller: controller.passwordController,
        validator: (value) {
          if (controller.passwordController.text.trim().isEmpty) {
            return 'Please enter password';
          }
          if (controller.passwordController.text.trim().length < 6) {
            return "Password should be at least 6 characters";
          }
          return null;
        },
        obscureText: !controller.isPasswordVisible.value,
        decoration: InputDecoration(
          hint: Text("Enter Password"),
          suffixIcon: IconButton(
            onPressed: () {
              controller.isPasswordVisible.value =
                  !controller.isPasswordVisible.value;
            },
            icon: controller.isPasswordVisible.value
                ? Icon(CupertinoIcons.eye_solid)
                : Icon(CupertinoIcons.eye_slash),
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.grey.shade50, width: 1.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.red.shade300, width: 1.0),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.blue.shade300, width: 1.0),
          ),

          fillColor: Colors.white12,
        ),
      ),
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        alignment: Alignment.center,
        elevation: 2,
        fixedSize: Size(Get.width, 48),
      ),
      onPressed: controller.validate,
      child: Text("Login"),
    );
  }
}
