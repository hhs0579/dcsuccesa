import 'package:dcsucces/pages/scan/code.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../utils/usercontroller.dart';
import 'login.dart';

class LogedIn extends StatelessWidget {
  LogedIn({super.key});
  final UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return userController.isLoggedIn.value
          ? const LoginCodePage()
          : const LoginPage();
    });
  }
}
