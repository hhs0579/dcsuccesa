import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference clubCollection =
      FirebaseFirestore.instance.collection('clubs');

  Future setUserData(
    DateTime date,
    String email,
    String name,
    String password,
  ) async {
    await userCollection.doc(uid).set({
      'date': date,
      'email': email,
      'name': name,
      'password': password,
      'uid': uid
    });
  }

  Future updateUserData(
    String name,
    String password,
  ) async {
    await userCollection.doc(uid).update({
      'name': name,
      'password': password,
    });
  }

  Future setClubData(
    String name,
    String image,
  ) async {
    await clubCollection.doc(name).set({
      'date': DateTime.now(),
      'name': name,
      'image': image,
      'clubmaster': uid,
      'clubuserlist': [uid],
      'clubuser': 1,
      'clubdonatepoint': 0,
      'isaccsess': false
    });
  }

  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }
}
