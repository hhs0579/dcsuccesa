import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';

import 'appdata.dart';
import 'myinfo.dart';



DatabaseController databaseController = DatabaseController();

class DatabaseController {
  Future<bool> isDuplicatedEmail(String email) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    if (querySnapshot.docs.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> isDuplicatedclubname(String clubname) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('clubs')
        .where('name', isEqualTo: clubname)
        .get();
    if (querySnapshot.docs.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> fetchMyInfo(String email) async {
    AppData appData = Get.find();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    if (querySnapshot.docs.isEmpty) {
    } else {
      appData.myInfo = MyInfo.fromJson(
          querySnapshot.docs.first.data() as Map<String, dynamic>);
    }
  }

  Future<void> updatePushToken(
      {required String email, required String pushToken}) async {
    AppData appData = Get.find();
    MyInfo newMyInfo = appData.myInfo;
    newMyInfo.pushToken = pushToken;
    appData.myInfo = newMyInfo;

    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    String id = querySnapshot.docs.first.id;

    await FirebaseFirestore.instance.collection('users').doc(id).update({
      'pushToken': pushToken,
    });
  }
}
