import 'package:dcsucces/database/appdata.dart';
import 'package:dcsucces/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final appdata = Get.put(AppData());
    return GetBuilder<AppData>(builder: (appdata) {
      return Scaffold(
        backgroundColor: ColorList.primary,
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                appdata.myInfo.uid,
                style: const TextStyle(fontSize: 29, color: Colors.black),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 40,
                ),
                child: const Text('My Page',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nato')),
              ),
            ],
          ),
        ),
      );
    });
  }
}
