import 'dart:convert';

PgmClass pgmClassFromJson(String str) => PgmClass.fromJson(json.decode(str));

String pgmClassToJson(PgmClass data) => json.encode(data.toJson());

class PgmClass {
  PgmClass({
    required this.offlinemod,
    required this.onlinemod,
    required this.paynotice,
    required this.payoffers,
  });

  List<Offlinemod> offlinemod;
  List<Onlinemod> onlinemod;
  String paynotice;
  List<Payoffer> payoffers;

  factory PgmClass.fromJson(Map<String, dynamic> json) => PgmClass(
        offlinemod: List<Offlinemod>.from(
            json["offlinemod"].map((x) => Offlinemod.fromJson(x))),
        onlinemod: List<Onlinemod>.from(
            json["onlinemod"].map((x) => Onlinemod.fromJson(x))),
        paynotice: json["paynotice"],
        payoffers: List<Payoffer>.from(
            json["payoffers"].map((x) => Payoffer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "offlinemod": List<dynamic>.from(offlinemod.map((x) => x.toJson())),
        "onlinemod": List<dynamic>.from(onlinemod.map((x) => x.toJson())),
        "paynotice": paynotice,
        "payoffers": List<dynamic>.from(payoffers.map((x) => x.toJson())),
      };
}

class Offlinemod {
  Offlinemod({
    required this.payTo,
    required this.payQr,
    required this.payVpa,
  });

  String payTo;
  String payQr;
  String payVpa;

  factory Offlinemod.fromJson(Map<String, dynamic> json) => Offlinemod(
        payTo: json["pay_to"],
        payQr: json["pay_qr"],
        payVpa: json["pay_vpa"],
      );

  Map<String, dynamic> toJson() => {
        "pay_to": payTo,
        "pay_qr": payQr,
        "pay_vpa": payVpa,
      };
}

class Onlinemod {
  Onlinemod({
    required this.pgMod,
    required this.pgName,
    required this.pgStatus,
    required this.pgUrl,
  });

  String pgMod;
  String pgName;
  String pgStatus;
  String pgUrl;

  factory Onlinemod.fromJson(Map<String, dynamic> json) => Onlinemod(
        pgMod: json["pg_mod"],
        pgName: json["pg_name"],
        pgStatus: json["pg_status"],
        pgUrl: json["pg_url"],
      );

  Map<String, dynamic> toJson() => {
        "pg_mod": pgMod,
        "pg_name": pgName,
        "pg_status": pgStatus,
        "pg_url": pgUrl,
      };
}

class Payoffer {
  Payoffer({
    required this.offerLink,
  });

  String offerLink;

  factory Payoffer.fromJson(Map<String, dynamic> json) => Payoffer(
        offerLink: json["offer_link"],
      );

  Map<String, dynamic> toJson() => {
        "offer_link": offerLink,
      };
}

/* 
List<PgmClass> pgmClassFromJson(String str) =>
    List<PgmClass>.from(json.decode(str).map((x) => PgmClass.fromJson(x)));

String pgmClassToJson(List<PgmClass> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PgmClass {
  PgmClass({
    required this.pgMod,
    required this.pgName,
    required this.pgStatus,
    required this.pgUrl,
  });

  String pgMod;
  String pgName;
  String pgStatus;
  String pgUrl;

  factory PgmClass.fromJson(Map<String, dynamic> json) => PgmClass(
        pgMod: json["pg_mod"],
        pgName: json["pg_name"],
        pgStatus: json["pg_status"],
        pgUrl: json["pg_url"],
      );

  Map<String, dynamic> toJson() => {
        "pg_mod": pgMod,
        "pg_name": pgName,
        "pg_status": pgStatus,
        "pg_url": pgUrl,
      };
}
 */