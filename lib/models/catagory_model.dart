import 'dart:convert';

List<Catlists> catlistsFromJson(String str) =>
    List<Catlists>.from(json.decode(str).map((x) => Catlists.fromJson(x)));

String catlistsToJson(List<Catlists> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Catlists {
  Catlists({
    required this.id,
    required this.catTitle,
    required this.catIurl,
    required this.catId,
    required this.status,
    this.createdBy,
    this.createdAt,
  });

  String id;
  String catTitle;
  String catIurl;
  String catId;
  String status;
  String? createdBy;
  DateTime? createdAt;

  factory Catlists.fromJson(Map<String, dynamic> json) => Catlists(
        id: json["id"],
        catTitle: json["cat_title"],
        catIurl: json["cat_iurl"],
        catId: json["cat_id"],
        status: json["status"],
        createdBy: json["created_by"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cat_title": catTitle,
        "cat_iurl": catIurl,
        "cat_id": catId,
        "status": status,
        "created_by": createdBy,
        "created_at": createdAt!.toIso8601String(),
      };
}
