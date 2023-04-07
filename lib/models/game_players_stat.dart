import 'package:slam_dunk_all_star_v2/models/game.dart';

class GamePlayerStat {
  int? id;
  String? long;
  String? visitorName;
  String? visitorLogo;
  int? visitorPoints;
  String? homeName;
  String? homeLogo;
  int? homePoints;
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

  GamePlayerStat(
      {this.id,
      this.long,
      this.visitorName,
      this.visitorLogo,
      this.visitorPoints,
      this.homeName,
      this.homeLogo,
      this.homePoints,
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
      this.steals,
      this.fouls,
      this.blocks,
      this.turnovers,
      this.offensiveRebond,
      this.defensiveRebond,
      this.playingTime
      // Initialiser d'autres propriétés si nécessaire
      });
}
