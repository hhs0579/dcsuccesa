import 'package:get/get.dart';

import 'myinfo.dart';

class AppData extends GetxController {
  int _myVersion = 0;
  int _latestVersion = 0;
  int _currentScreenIndex = 0;
  bool _isLoadingScreen = false;
  String _userEmail = '';
  // bool _isExpertMode = false;
  MyInfo _myInfo = MyInfo(
      date: DateTime.now(),
      email: '',
      password: '',
      name: '',
      pushToken: '',
      uid: '',
      datetime: '',
      pillname: '');


  int get currentScreenIndex => _currentScreenIndex;
  set currentScreenIndex(int currentScreenIndex) {
    _currentScreenIndex = currentScreenIndex;
    update();
  }

  int get myVersion => _myVersion;
  set myVersion(int version) {
    _myVersion = version;
    update();
  }

  int get latestVersion => _latestVersion;
  set latestVersion(int latestVersion) {
    _latestVersion = latestVersion;
    update();
  }

  MyInfo get myInfo => _myInfo;
  set myInfo(MyInfo myInfo) {
    _myInfo = myInfo;
    update();
  }



  String get userEmail => _userEmail;
  set userEmail(String userEmail) {
    _userEmail = userEmail;
    update();
  }

  bool get isLoadingScreen => _isLoadingScreen;
  set isLoadingScreen(bool isLoadingScreen) {
    _isLoadingScreen = isLoadingScreen;
    update();
  }
}
