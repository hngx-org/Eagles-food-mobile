class LeaderBoard {
  int id, points;
  String name;

  LeaderBoard({
    required this.name,
    required this.id,
    required this.points
  });

  factory LeaderBoard.fromJson(Map<String, dynamic> data) =>
      LeaderBoard(
          name: data['name'],
          id: data['id'],
          points: data['points']
      );

  Map<String, dynamic> toJson()=> {
    'id': id,
    'name': name,
    'points': points
  };

}