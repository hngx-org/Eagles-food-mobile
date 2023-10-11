// {id: 1, senderId: 25, senderName: Akams, receiverId: 10, receiverName: doe, quantity: 4, redeemed: false, lunchStatus: 0, note: Heeey, createdAt: 2023-10-09T21:58:21},
class Lunch {
  final int id, senderId, receiverId, quantity, lunchStatus;
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
        required this.lunchStatus,
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
        lunchStatus: json['lunchStatus'],
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
        'lunchStatus': lunchStatus,
        'createdAt': createdAt
      };
}
