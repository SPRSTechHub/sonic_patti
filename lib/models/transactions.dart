import 'dart:convert';

List<TransactionsClass> transactionsClassFromJson(String str) =>
    List<TransactionsClass>.from(
        json.decode(str).map((x) => TransactionsClass.fromJson(x)));

String transactionsClassToJson(List<TransactionsClass> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransactionsClass {
  TransactionsClass({
    required this.date,
    this.descp,
    required this.trAmnt,
    required this.trType,
    required this.trNo,
  });

  String date;
  String? descp;
  String trAmnt;
  String trType;
  String trNo;

  factory TransactionsClass.fromJson(Map<String, dynamic> json) =>
      TransactionsClass(
        date: json["date"],
        descp: json["descp"],
        trAmnt: json["tr_amnt"],
        trType: json["tr_type"],
        trNo: json["tr_no"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "descp": descp,
        "tr_amnt": trAmnt,
        "tr_type": trType,
        "tr_no": trNo,
      };
}
