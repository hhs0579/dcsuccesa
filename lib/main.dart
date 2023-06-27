import 'package:dcsucces/start/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
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
      home: const LoginPage(),
    );
  }
}
