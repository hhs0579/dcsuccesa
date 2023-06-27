import 'package:dcsucces/pages/start/start.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/logger.dart';

FirebaseAuth auth = FirebaseAuth.instance;
User? user = auth.currentUser;
String? uid = user?.uid;
var logger = Logger(
  printer: PrettyPrinter(),
);
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Firebase.initializeApp();
  // Firebase Messaging 초기화
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{};
  // final bottomNavigationController = BottomNavigationController();
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // bottomNavigationController.setup();
    return GetMaterialApp(
      title: '#dcsucces',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: const [
        // GetPage(name: '/main', page: () => const MainScreen()),
        // GetPage(name: '/setting', page: () => const mySettings()),
        // GetPage(name: '/mypage', page: () => const Mypage()),
      ],
      theme: ThemeData(
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Color(0xffB9A0FE),
            showSelectedLabels: true,
            showUnselectedLabels: false,
          ),
          primarySwatch: Colors.deepPurple,
          fontFamily: 'Noto'),
      home: const StartPage(),
    );
  }
}
