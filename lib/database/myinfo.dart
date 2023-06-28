MyInfo? myInfo;

class MyInfo {
  DateTime date;
  String email;
  String name;
  String password;
  String uid;

  MyInfo({
    required this.date,
    required this.email,
    required this.password,
    required this.name,
    required this.uid,
  });

  MyInfo.fromJson(Map<String, dynamic> json)
      : date = json['date'].toDate(),
        email = json['email'],
        password = json['password'],
        name = json['name'],
        uid = json['uid'];

  Map<String, dynamic> toJson() => {
        'date': date,
        'email': email,
        'password': password,
        'name': name,
        'uid': uid
      };
}
