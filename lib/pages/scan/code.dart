import 'package:dcsucces/pages/scan/mypage.dart';
import 'package:dcsucces/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../database/appdata.dart';
import 'scanpage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginCodePage extends StatefulWidget {
  const LoginCodePage({super.key});

  @override
  State<LoginCodePage> createState() => _LoginCodePageState();
}

class _LoginCodePageState extends State<LoginCodePage> {
  AppData appdata = Get.find();
  void navigateToNextPage() {
    Get.to(() => const ScanPage());
  }

  void onLoginButtonPressed(String uid) async {
    try {
      final UserCredential userCredential = await _auth.signInAnonymously();

      if (userCredential.user != null) {
        final String loggedInUid = userCredential.user!.uid;
        if (uid == loggedInUid) {
          navigateToNextPage();
        } else {
          // uid가 일치하지 않는 경우 처리
        }
      }
    } catch (e) {
      // 로그인 실패 처리
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorList.primary,
      body: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('#dcsucces',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nato')),
                  InkWell(
                    onTap: () {
                      Get.to(const MyPage());
                    },
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40,
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                const Text('로그인 코드',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nato')),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: '로그인 코드 입력',
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    width: width * 0.55,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Text(
                      '입력',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Noto',
                          fontWeight: FontWeight.w900,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(bottom: 40),
                alignment: Alignment.center,
                width: width * 0.85,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '다음',
                  style: TextStyle(
                      fontFamily: 'Noto',
                      fontWeight: FontWeight.w900,
                      fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
