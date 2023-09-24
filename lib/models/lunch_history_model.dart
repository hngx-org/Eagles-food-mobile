class LunchHistoryModel {
  final String reason;
  final String? senderName;
  final String? receiverName;
  final DateTime time;
  final int lunchAmount;
  final bool isReceived;

  LunchHistoryModel(
      {required this.reason,
      this.senderName,
      this.receiverName,
      required this.time,
      required this.lunchAmount,
      required this.isReceived});

  static List<LunchHistoryModel> dummyHistory = [
    LunchHistoryModel(
        reason: "Team Collaboration Champion",
        time: DateTime(2023, 9, 10),
        lunchAmount: 3,
        senderName: "Aaron Ogbemi",
        isReceived: true),
    LunchHistoryModel(
        reason: "Team Collaboration Champion",
        time: DateTime(2023, 5, 10),
        lunchAmount: 2,
        receiverName: "Adesina Adebayo",
        isReceived: false),
    LunchHistoryModel(
        reason: "Timely Project Delivery",
        time: DateTime(2023, 7, 3),
        lunchAmount: 1,
        senderName: "Ameerah Suleiman",
        isReceived: true),
    LunchHistoryModel(
        reason: "Timely Project Delivery",
        time: DateTime(2023, 5, 10),
        lunchAmount: 1,
        receiverName: "Boluwatife Bolaji",
        isReceived: false),
    LunchHistoryModel(
        reason: "Timely Project Delivery",
        time: DateTime(2023, 8, 16),
        lunchAmount: 1,
        receiverName: "Divine Akubo",
        isReceived: false),
  ];

  String get amountTittle => isReceived ? '+$lunchAmount' : '-$lunchAmount';

  String get senderOrReceiverTittle =>
      isReceived ? 'From $senderName' : 'To $receiverName';

  String get subtittle =>
      isReceived ? 'Received Free Lunch' : 'Sent Free Lunch';
}
