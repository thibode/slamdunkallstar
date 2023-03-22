class Team {
  int? id;
  String? name;
  String? city;
  String? logo;
  String? conference;
  String? division;
  bool? nbaFranchise;

  Team({this.id, this.name, this.city, this.logo, this.conference, this.division, this.nbaFranchise});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json["id"],
      name: json["name"],
      city: json["city"],
      logo: json["logo"],
      conference: json["leagues"]["standard"]["conference"],
      division: json["leagues"]["standard"]["division"],
      nbaFranchise: json["nbaFranchise"]
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["city"] = city;
    return data;
  }
}
