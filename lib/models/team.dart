class Team {
  final String id, name, email, role;
  String? image;

  Team({
    required this.name,
    required this.email,
    required this.role,
    required this.id,
    required this.image,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['user_id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      image: json['profile_picture'] ?? "assets/images/team-1.png",
    );
  }

  Map<String, dynamic> toJson() => {
        "user_id": id,
        "name": name,
        "email": email,
        "role": role,
        "profile_picture": image ?? "assets/images/team-1.png",
      };
}
