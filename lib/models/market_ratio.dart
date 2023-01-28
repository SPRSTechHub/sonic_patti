// To parse this JSON data, do
//
//     final mktClass = mktClassFromJson(jsonString);

import 'dart:convert';

MktClass mktClassFromJson(String str) => MktClass.fromJson(json.decode(str));

String mktClassToJson(MktClass data) => json.encode(data.toJson());

class MktClass {
  MktClass({
    required this.id,
    required this.catId,
    this.sd,
    this.sp,
    this.dp,
    this.tp,
    this.cp,
    this.jodi,
    this.uploadBy,
  });

  String id;
  String catId;
  String? sd;
  String? sp;
  String? dp;
  String? tp;
  String? cp;
  String? jodi;
  DateTime? uploadBy;

  factory MktClass.fromJson(Map<String, dynamic> json) => MktClass(
        id: json["id"],
        catId: json["cat_id"],
        sd: json["sd"],
        sp: json["sp"],
        dp: json["dp"],
        tp: json["tp"],
        cp: json["cp"],
        jodi: json["jodi"],
        uploadBy: DateTime.parse(json["upload_by"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cat_id": catId,
        "sd": sd,
        "sp": sp,
        "dp": dp,
        "tp": tp,
        "cp": cp,
        "jodi": jodi,
        "upload_by": uploadBy!.toIso8601String(),
      };
}
