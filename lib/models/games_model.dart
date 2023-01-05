import 'dart:convert';

List<GameLists> gameListsFromJson(String str) =>
    List<GameLists>.from(json.decode(str).map((x) => GameLists.fromJson(x)));

String gameListsToJson(List<GameLists> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GameLists {
  GameLists({
    required this.id,
    required this.matchId,
    required this.matchTime,
    required this.day,
    required this.gameTitle,
    required this.gameId,
    required this.catTitle,
    required this.catId,
    required this.matchIcon,
    required this.status,
    required this.live,
  });

  String id;
  String matchId;
  String matchTime;
  String day;
  String gameTitle;
  String gameId;
  String catTitle;
  String catId;
  String matchIcon;
  String status;
  String live;

  factory GameLists.fromJson(Map<String, dynamic> json) => GameLists(
        id: json["id"],
        matchId: json["match_id"],
        matchTime: json["match_time"],
        day: json["day"],
        gameTitle: json["game_title"],
        gameId: json["game_id"],
        catTitle: json["cat_title"],
        catId: json["cat_id"],
        matchIcon: json["match_icon"],
        status: json["status"],
        live: json["live"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "match_id": matchId,
        "match_time": matchTime,
        "day": day,
        "game_title": gameTitle,
        "game_id": gameId,
        "cat_title": catTitle,
        "cat_id": catId,
        "match_icon": matchIcon,
        "status": status,
        "live": live,
      };
}
