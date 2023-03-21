class Game {
  int? id;
  String? long;
  String? visitorName;
  String? visitorLogo;
  int? visitorPoints;
  String? homeName;
  String? homeLogo;
  int? homePoints;

  Game({
    this.id,
    this.long,
    this.visitorName,
    this.visitorLogo,
    this.visitorPoints,
    this.homeName,
    this.homeLogo,
    this.homePoints,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json["id"],
      long: json["status"]["long"],
      visitorName: json["teams"]["visitors"]["name"],
      visitorLogo: json["teams"]["visitors"]["logo"],
      visitorPoints: json["scores"]["visitors"]["points"],
      homeName: json["teams"]["home"]["name"],
      homeLogo: json["teams"]["home"]["logo"],
      homePoints: json["scores"]["home"]["points"],
    );
  }
}
