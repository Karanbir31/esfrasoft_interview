

import 'package:esfrasoft_interview/app/modules/auth/controller/auth_controller.dart';
import 'package:get/get.dart';

class AuthBindings extends Bindings {

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>AuthController());
  }
}