// To parse this JSON data, do
//
//     final winModal = winModalFromJson(jsonString);

import 'dart:convert';

List<WinModal> winModalFromJson(String str) =>
    List<WinModal>.from(json.decode(str).map((x) => WinModal.fromJson(x)));

String winModalToJson(List<WinModal> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WinModal {
  WinModal({
    required this.date,
    required this.game,
    this.time,
    required this.patti,
    required this.digit,
    required this.amount,
  });

  String date;
  String game;
  String? time;
  String patti;
  String digit;
  String amount;

  factory WinModal.fromJson(Map<String, dynamic> json) => WinModal(
        date: json["date"],
        game: json["game"],
        time: json["time"],
        patti: json["patti"],
        digit: json["digit"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "game": game,
        "time": time,
        "patti": patti,
        "digit": digit,
        "amount": amount,
      };
}
