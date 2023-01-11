// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class BidsModal {
  final String? bidNum;
  final String? bidAmnt;

  BidsModal({@required this.bidNum, @required this.bidAmnt});
}

List<BidsList> bidsListFromJson(String str) =>
    List<BidsList>.from(json.decode(str).map((x) => BidsList.fromJson(x)));

String bidsListToJson(List<BidsList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BidsList {
  BidsList({
    required this.date,
    required this.game,
    required this.time,
    required this.patti,
    required this.digit,
    required this.amount,
  });

  String date;
  String game;
  String time;
  String patti;
  String digit;
  String amount;

  factory BidsList.fromJson(Map<String, dynamic> json) => BidsList(
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
