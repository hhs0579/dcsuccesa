import 'package:dcsucces/pages/scan/code.dart';
import 'package:dcsucces/pages/start/start.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'database/appdata.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  Get.put(AppData());
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final routes = <String, WidgetBuilder>{};

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
      home: const MainPage(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppData>(
      builder: (appdata) {
        return FutureBuilder<bool>(
          future: checkLoginStatus(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              if (snapshot.data == true) {
                return const LoginCodePage();
              } else {
                return const StartPage();
              }
            }
          },
        );
      },
    );
  }

  Future<bool> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    return isLoggedIn;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
