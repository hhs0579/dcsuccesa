import 'package:get/get.dart';

class UserController extends GetxController {
  RxBool isLoggedIn = false.obs;

  void setLoggedIn(bool value) {
    isLoggedIn.value = value;
  }
}
