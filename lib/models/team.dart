class Team {
  int? id;
  String? name;
  String? city;
  String? logo;
  String? conference;
  String? division;
  String? description;
  String? createdAt;
  bool? nbaFranchise;

  Team(
      {this.id,
      this.name,
      this.city,
      this.logo,
      this.conference,
      this.division,
      this.nbaFranchise,
      this.description,
      this.createdAt});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        createdAt: json["createdAt"],
        city: json["city"],
        logo: json["logo"],
        conference: json["leagues"]["standard"]["conference"],
        division: json["leagues"]["standard"]["division"],
        nbaFranchise: json["nbaFranchise"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["city"] = city;
    return data;
  }
}
