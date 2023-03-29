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

class GameStatistic {
  int? idTeam;
  String? name;
  String? logo;
  int? fieldGoalsMade;
  int? fieldGoalsAttempt;
  String? fieldGoalsPercentage;
  int? freeThrowsMade;
  int? freeThrowsAttempt;
  String? freeThrowsPercentage;
  int? threePointersMade;
  int? threePointersAttempt;
  String? threePointersPercentage;
  int? assists;
  int? points;
  int? steals;
  int? fouls;
  int? turnovers;
  int? offensiveRebond;
  int? defensiveRebond;
  int? totalRebond;
  int? blocks;

  GameStatistic(
      {this.idTeam,
      this.name,
      this.logo,
      this.fieldGoalsMade,
      this.fieldGoalsAttempt,
      this.fieldGoalsPercentage,
      this.freeThrowsMade,
      this.freeThrowsAttempt,
      this.freeThrowsPercentage,
      this.threePointersMade,
      this.threePointersAttempt,
      this.threePointersPercentage,
      this.assists,
      this.points,
      this.steals,
      this.fouls,
      this.turnovers,
      this.offensiveRebond,
      this.defensiveRebond,
      this.totalRebond,
      this.blocks});

  factory GameStatistic.fromJson(Map<String, dynamic> json) {
    return GameStatistic(
      idTeam: json["team"]["id"],
      name: json["team"]["name"],
      logo: json["team"]["logo"],
      fieldGoalsMade: json["statistics"][0]["fgm"],
      fieldGoalsAttempt: json["statistics"][0]["fga"],
      fieldGoalsPercentage: json["statistics"][0]["fgp"],
      freeThrowsMade: json["statistics"][0]["ftm"],
      freeThrowsAttempt: json["statistics"][0]["fta"],
      freeThrowsPercentage: json["statistics"][0]["ftp"],
      threePointersMade: json["statistics"][0]["tpm"],
      threePointersAttempt: json["statistics"][0]["tpa"],
      threePointersPercentage: json["statistics"][0]["tpp"],
      assists: json["statistics"][0]["assists"],
      points: json["statistics"][0]["points"],
      steals: json["statistics"][0]["steals"],
      fouls: json["statistics"][0]["pFouls"],
      turnovers: json["statistics"][0]["turnovers"],
      offensiveRebond: json["statistics"][0]["offReb"],
      defensiveRebond: json["statistics"][0]["defReb"],
      totalRebond: json["statistics"][0]["totReb"],
      blocks: json["statistics"][0]["blocks"],
    );
  }
}
