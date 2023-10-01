// {
// "id": 38388529,
// "senderId": 92596207,
// "senderName": "Mary",
// "receiverId": 92596201,
// "receiverName": "clark",
// "quantity": 4,
// "redeemed": false,
// "note": "Hello i am testing",
// "createdAt": "2023-09-24T13:20:36"
// },
class Lunch {
  final int id, senderId, receiverId, quantity;
  final String senderName, receiverName, note, createdAt;
  final bool redeemed;

  Lunch(
      {required this.id,
      required this.senderId,
      required this.senderName,
      required this.receiverId,
      required this.receiverName,
      required this.quantity,
      required this.redeemed,
      required this.note,
      required this.createdAt});

  factory Lunch.fromJson(Map<String, dynamic> json) {
    return Lunch(
        id: json['id'],
        senderId: json['senderId'],
        senderName: json['senderName'],
        receiverId: json['receiverId'],
        receiverName: json['receiverName'],
        quantity: json['quantity'],
        redeemed: json['redeemed'],
        note: json['note'],
        createdAt: json['createdAt']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'senderId': senderId,
        'senderName': senderName,
        'receiverId': receiverId,
        'receiverName': receiverName,
        'quantity': quantity,
        'redeemed': redeemed,
        'note': note,
        'createdAt': createdAt
      };
}
