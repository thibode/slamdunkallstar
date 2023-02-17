class Team {
  String name = "";
  String city = "";

  Team({name, city});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(name: json['name'], city: json['city']);
  }
}
