import 'package:dcsucces/utils/color.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final passwordFocusNode = FocusNode();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordHide = true;
  Widget _userIdWidget() {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      controller: emailController,
      textInputAction: TextInputAction.next,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(passwordFocusNode),
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: '이메일 주소 입력',
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          // == null or isEmpty
          return '이메일을 입력해주세요.';
        }
        return null;
      },
    );
  }

  Widget _passwordWidget() {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      controller: passwordController,
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      focusNode: passwordFocusNode,
      decoration: const InputDecoration(labelText: '비밀번호 입력'),
      validator: (String? value) {
        if (value!.isEmpty) {
          // == null or isEmpty
          return '비밀번호를 입력해주세요.';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorList.primary,
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    width: width,
                    height: height,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 40),
                          child: const Text('로그인',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Nato')),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text('이메일 주소를\n입력해주세요!',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Nato')),
                        ),
                        _userIdWidget(),
                        Container(
                          margin: const EdgeInsets.only(top: 40),
                          alignment: Alignment.centerLeft,
                          child: const Text('사용하실 비밀번호를\n입력해주세요!',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Nato')),
                        ),
                        _passwordWidget()
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: _login,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  width: width * 0.9,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    '확인',
                    style: TextStyle(
                        fontFamily: 'Noto',
                        fontWeight: FontWeight.w900,
                        fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  void initState() {
    //해당 클래스가 호출되었을떄
    super.initState();
  }

  @override
  void dispose() {
    // 해당 클래스가 사라질떄
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  _login() async {
    //키보드 숨기기
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).requestFocus(FocusNode());
      // Firebase 사용자 인증, 사용자 등록
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLoggedIn', true);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
      } on FirebaseAuthException catch (e) {
        logger.e(e);
        String message = '';

        if (e.code == 'user-not-found') {
          message = '사용자가 존재하지 않습니다.';
        } else if (e.code == 'wrong-password') {
          message = '비밀번호를 확인하세요';
        } else if (e.code == 'invalid-email') {
          message = '이메일을 확인하세요.';
        }

        /*final snackBar = SnackBar(
          content: Text(message),
          backgroundColor: Colors.deepOrange,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      */

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Colors.deepOrange,
          ),
        );
      }
    }
  }
}
