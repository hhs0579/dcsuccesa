import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import 'appdata.dart';
import 'dbcontroller.dart';
import 'localcon.dart';

AuthController authController = AuthController();

class AuthController {
  Future authUser(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _saveLocalStorage(userCredential);
      String? pushToken = await getToken();
      if (pushToken != null) {
        databaseController.updatePushToken(
          email: email,
          pushToken: pushToken,
        );
      }
      AppData appData = Get.find();
      await databaseController.fetchMyInfo(appData.myInfo.email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return '잘못된 이메일 입니다.';
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return '비밀번호를 다시 한번 확인해주세요..';
      } else {
        print(e);
        return e.code.toString();
      }
    }
    return null;
  }

  Future<void> _saveLocalStorage(UserCredential userCredential) async {
    AppData appData = Get.find();
    appData.userEmail = userCredential.user?.email ?? 'null';
    appData.myInfo.email = appData.userEmail;
    // appData.isExpertMode =
    //     await databaseController.isExpertMode(appData.userEmail);
    localStorageController.setUserEmail(appData.userEmail);
  }

  Future<void> handleSignOut() async {
    await localStorageController.setUserEmail('');
    await FirebaseAuth.instance.signOut();
  }

  Future<String?> getToken() async {
    return await FirebaseMessaging.instance.getToken();
  }
}
