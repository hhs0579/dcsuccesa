import 'package:dcsucces/pages/start/start.dart';
import 'package:dcsucces/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../database/db.dart';
import '../../database/dbcontroller.dart';
import '../../utils/authservice.dart';
import '../../utils/toast.dart';
import 'joinval.dart';

class Regist extends StatefulWidget {
  const Regist({super.key});

  @override
  State<Regist> createState() => _RegistState();
}

class _RegistState extends State<Regist> {
  final bool _isAuthsms = false;

  late String email = '';
  late String name = '';
  late String password = '';
  final verifyPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  final passwordFocusNode = FocusNode();
  final verifyPasswordFocusNode = FocusNode();
  final otpFocusNode = FocusNode();
  final deaddressFocusNode = FocusNode();

  bool authOk = false;
  bool isotpconfirm = false;
  bool duplicateEmail = false;
  bool passwordHide = true;

  late String verificationId = '';

  DatabaseController databaseController = DatabaseController();

  final AuthController _authJoin = AuthController();

  final _postTextEditor = TextEditingController();
  final _addressTextEditor = TextEditingController();
  final _deaddressTextEditor = TextEditingController();
  final phoneNumber = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final AuthController _authService = AuthController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> createUserWithEmailAndPassword(
      String email, String password) async {
    final UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;
    await DatabaseService(uid: user!.uid).setUserData(
      DateTime.now(),
      email,
      nameController.text,
      password,
    );

    return user.uid;
  }

  Future<UserCredential?> signUpUserCredential(
      {required String email, required String password}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      await DatabaseService(uid: user!.uid).setUserData(
        DateTime.now(),
        email,
        nameController.text,
        password,
      );
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorList.primary,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: height * 1.1,
                width: width,
                color: ColorList.primary,
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 40),
                        child: const Text('회원 가입',
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
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () => FocusScope.of(context)
                                  .requestFocus(passwordFocusNode),
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              decoration:
                                  const InputDecoration(labelText: '이메일 주소 입력'),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            height: 30,
                            child: TextButton(
                              onPressed: () async {
                                if (vaildationemail(emailController.text) ==
                                    null) {
                                  if (await databaseController
                                          .isDuplicatedEmail(
                                              emailController.text) ==
                                      true) {
                                    toastMessage('중복된 이메일입니다. 다시 입력해주세요.');
                                  } else {
                                    duplicateEmail = true;
                                    toastMessage('사용가능한 이메일입니다');
                                  }
                                }
                              },
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.deepPurple,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: const Text(
                                "확인",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        alignment: Alignment.centerLeft,
                        child: const Text('사용하실 이름을\n입력해주세요!',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Nato')),
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration:
                            const InputDecoration(labelText: '사용하실 이름 입력'),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        alignment: Alignment.centerLeft,
                        child: const Text('사용하실 비밀번호를\n입력해주세요!',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Nato')),
                      ),
                      TextFormField(
                        controller: passwordController,
                        decoration:
                            const InputDecoration(labelText: '사용하실 비밀번호 입력'),
                        keyboardType: TextInputType.visiblePassword,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(verifyPasswordFocusNode),
                        focusNode: passwordFocusNode,
                        obscureText: passwordHide,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        alignment: Alignment.centerLeft,
                        child: const Text('비밀번호 다시\n입력해주세요!',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Nato')),
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: '사용하실 비밀번호 입력'),
                        keyboardType: TextInputType.visiblePassword,
                        focusNode: verifyPasswordFocusNode,
                        obscureText: passwordHide,
                        controller: verifyPasswordController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              if (duplicateEmail == false) {
                toastMessage('이메일 인증을 완료해 주세요.');
              } else {
                if (passwordController.text.length < 6) {
                  toastMessage("비밀번호는 최소 6자리 이상이여야합니다");
                } else {
                  if (passwordController.text !=
                      verifyPasswordController.text) {
                    toastMessage("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
                  } else {
                    createUserWithEmailAndPassword(
                        emailController.text, passwordController.text);
                    toastMessage("가입이 완료되었습니다.");
                    Get.offAll(const StartPage());
                  }
                }
              }
            },
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
    );
  }
}
