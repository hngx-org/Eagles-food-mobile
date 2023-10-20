
class OrgRequest {

  // {id: 47,
  // senderId: 25,
  // senderName: Boss,
  // receiverId: 58,
  // receiverName: steven,
  // quantity: 10,
  // redeemed: false,
  // lunchStatus: 0,
  // note: Final,
  // createdAt: 2023-10-12T20:00:54},

  final int id;
  final int orgId;
  final String org, email;
  final bool? status;
  final String createdAt;

  OrgRequest({
    required this.id,
    required this.orgId,
    required this.org,
    required this.email,
    required this.createdAt,
    required this.status
  });

  factory OrgRequest.fromJson(Map<String, dynamic> json) {
    return OrgRequest(
      id: json['id'],
      orgId: json['orgId'],
      org: json['org'],
      email: json['email'],
      status: json['status'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "orgId": orgId,
    "org": org,
    "email": email,
    "status": status,
    "createdAt": createdAt,
  };
}