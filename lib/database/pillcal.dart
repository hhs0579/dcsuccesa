PillCal? pillcal;

class PillCal {
  DateTime date;
  String startDate;
  String endDate;
  String pillName;
  String uid;

  PillCal(
      {required this.date,
      required this.startDate,
      required this.endDate,
      required this.pillName,
      required this.uid});

  PillCal.fromJson(Map<String, dynamic> json)
      : date = json['date'].toDate(),
        startDate = json['startDate'],
        endDate = json['endDate'],
        pillName = json['pillName'],
        uid = json['uid'];

  Map<String, dynamic> toJson() => {
        'date': date,
        'startDate': startDate,
        'endDate': endDate,
        'pillName': pillName,
        'uid': uid
      };
}
