import 'package:dcsucces/pages/start/login.dart';
import 'package:dcsucces/pages/start/regist.dart';
import 'package:dcsucces/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: ColorList.primary,
        padding: const EdgeInsets.all(12),
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 100),
                alignment: Alignment.center,
                child: const Text('#dcsucces',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nato'))),
            InkWell(
              onTap: () {
                Get.to(const LoginPage());
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                width: width * 0.85,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '로그인',
                  style: TextStyle(
                      fontFamily: 'Noto',
                      fontWeight: FontWeight.w900,
                      fontSize: 16),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(const Regist());
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                width: width * 0.85,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '회원가입',
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
