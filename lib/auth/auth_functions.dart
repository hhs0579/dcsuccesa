import 'package:firebase_auth/firebase_auth.dart';

Future<void> registerUser(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    print('회원가입이 완료되었습니다.');
  } catch (e) {
    print('회원가입에 실패하였습니다: $e');
  }
}

Future<void> signInUser(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print('로그인되었습니다: ${userCredential.user!.email}');
  } catch (e) {
    print('로그인에 실패하였습니다: $e');
  }
}

Future<void> signOutUser() async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    await _auth.signOut();
    print('로그아웃되었습니다.');
  } catch (e) {
    print('로그아웃에 실패하였습니다: $e');
  }
}

Future<void> deleteUser() async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    User? user = _auth.currentUser;
    await user!.delete();
    print('회원탈퇴되었습니다.');
  } catch (e) {
    print('회원탈퇴에 실패하였습니다: $e');
  }
}
