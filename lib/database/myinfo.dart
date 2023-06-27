MyInfo? myInfo;

class MyInfo {
  DateTime date;
  String email;
  String name;
  String password;
  String pushToken;
  String uid;
  String datetime;
  String pillname;

  MyInfo(
      {required this.date,
      required this.email,
      required this.password,
      required this.name,
      required this.pushToken,
      required this.uid,
      required this.datetime,
      required this.pillname});

  MyInfo.fromJson(Map<String, dynamic> json)
      : date = json['date'].toDate(),
        email = json['email'],
        password = json['password'],
        name = json['name'],
        pushToken = json['pushToken'] ?? '',
        datetime = json['datetime'],
        pillname = json['pillname'],
        uid = json['uid'];

  Map<String, dynamic> toJson() => {
        'date': date,
        'email': email,
        'password': password,
        'name': name,
        'pushToken': pushToken,
        'uid': uid
      };
}
