class Player {
  String? firstname;
  String? lastname;
  String? birth;
  int? startNBA;

  Player({this.firstname, this.lastname, this.birth, this.startNBA});

  factory Player.fromJson(Map<String, dynamic> json) {
    return (Player(
        firstname: json["firstname"],
        lastname: json["lastname"],
        birth: json["birht"],
        startNBA: json["start"]));
  }
}
