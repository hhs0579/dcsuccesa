PillInfo? pillinfo;

class PillInfo {
  String itemName;
  String efcyQesitm;
  String useMethodQesitm;
  String atpnQesitm;
  String depositMethodQesitm;

  PillInfo(
      {required this.itemName,
      required this.efcyQesitm,
      required this.useMethodQesitm,
      required this.atpnQesitm,
      required this.depositMethodQesitm});

  PillInfo.fromJson(Map<String, dynamic> json)
      : itemName = json['itemName'],
        efcyQesitm = json['efcyQesitm'],
        useMethodQesitm = json['useMethodQesitm'],
        atpnQesitm = json['atpnQesitm'],
        depositMethodQesitm = json['depositMethodQesitm'];

  Map<String, dynamic> toJson() => {
        'itemName': itemName,
        'efcyQesitm': efcyQesitm,
        'useMethodQesitm': useMethodQesitm,
        'atpnQesitm': atpnQesitm,
        'depositMethodQesitm': depositMethodQesitm
      };
}
