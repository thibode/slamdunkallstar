class Player {
  int? playerId;
  String? firstname;
  String? lastname;
  String? birth;
  String? birthCountry;
  int? startNBA;
  String? meters;
  String? weight;
  String? college;

  Player(
      {this.playerId,
      this.firstname,
      this.lastname,
      this.birth,
      this.birthCountry,
      this.startNBA,
      this.meters,
      this.weight,
      this.college});

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
        playerId: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        birth: json["birth"]["date"],
        birthCountry: json["birth"]["country"],
        startNBA: json["nba"]["start"],
        meters: json["height"]["meters"],
        weight: json["weight"]["kilograms"],
        college: json["college"]);
  }
}

class PlayerStats {
  int? playerId;
  int? teamId;
  int? gameId;
  String? teamName;
  String? position;
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
  int? blocks;
  int? turnovers;
  int? offensiveRebond;
  int? defensiveRebond;
  String? playingTime;

  PlayerStats(
      {this.playerId,
      this.teamId,
      this.teamName,
      this.gameId,
      this.position,
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
      this.fouls,
      this.steals,
      this.blocks,
      this.turnovers,
      this.offensiveRebond,
      this.defensiveRebond,
      this.playingTime});

  factory PlayerStats.fromJson(Map<String, dynamic> json) {
    return PlayerStats(
        playerId: json["player"]["id"],
        teamId: json["team"]["id"],
        teamName: json["team"]["name"],
        gameId: json["game"]["id"],
        position: json["pos"],
        fieldGoalsMade: json["fgm"],
        fieldGoalsAttempt: json["fga"],
        fieldGoalsPercentage: json["fgp"],
        freeThrowsMade: json["ftm"],
        freeThrowsAttempt: json["fta"],
        freeThrowsPercentage: json["ftp"],
        threePointersMade: json["tpm"],
        threePointersAttempt: json["tpa"],
        threePointersPercentage: json["tpp"],
        assists: json["assists"],
        points: json["points"],
        fouls: json["pFouls"],
        steals: json["steals"],
        blocks: json["blocks"],
        turnovers: json["turnovers"],
        playingTime: json["time"]);
  }
}
