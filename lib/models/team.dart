class Team {
  String name = "";
  String city = "";

  Team({name, city});

  factory Team.fromJson(Map<String, dynamic> json) {
    // final Map<String, dynamic> properties = json['properties'] ?? {};
    // final String name = properties['name'];
    // final String city = properties['city'];
    return Team(name: json['name'], city: json['city']);
  }
}
