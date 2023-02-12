import 'dart:convert';

GameOfferModel gameOfferModelFromJson(String str) =>
    GameOfferModel.fromJson(json.decode(str));

String gameOfferModelToJson(GameOfferModel data) => json.encode(data.toJson());

class GameOfferModel {
  GameOfferModel({
    required this.notices,
    required this.result,
  });

  String notices;
  List<Result> result;

  factory GameOfferModel.fromJson(Map<String, dynamic> json) => GameOfferModel(
        notices: json["notices"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "notices": notices,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.offerLink,
  });

  String offerLink;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        offerLink: json["offer_link"],
      );

  Map<String, dynamic> toJson() => {
        "offer_link": offerLink,
      };
}
