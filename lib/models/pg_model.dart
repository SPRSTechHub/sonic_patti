import 'dart:convert';

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
