class Team {
  int? id;
  String? name;
  String? city;

  Team({this.name, this.city, this.id});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json["id"],
      name: json["name"],
      city: json["city"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["city"] = city;
    return data;
  }
}
