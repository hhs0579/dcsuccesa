import 'package:dcsucces/utils/color.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              width: width * 0.8,
              child: Image.asset(
                'assets/images/1.png',
              ),
            ),
            Container(
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
            Container(
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
          ],
        ),
      ),
    );
  }
}
