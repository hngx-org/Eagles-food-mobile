class LeaderBoard {
  int quantity;
  String name, email;

  LeaderBoard({
    required this.name,
    required this.email,
    required this.quantity
  });

  factory LeaderBoard.fromJson(Map<String, dynamic> data) =>
      LeaderBoard(
          name: data['senderName'],
          email: data['senderEmail'],
          quantity: data['quantity']
      );

  Map<String, dynamic> toJson()=> {
    'senderEmail': email,
    'senderName': name,
    'quantity': quantity
  };

}