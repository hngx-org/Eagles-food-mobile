
class SendInvite {
  int? id;
  int orgId;
  String org;
  String? createdAt;
  bool? status;
  String? email;

  SendInvite({
    required this.id,
    required this.orgId,
    required this.org,
    required this.createdAt,
    required this.status,
    required this.email
  });

  factory SendInvite.fromJson(Map<String, dynamic> json) {
    return SendInvite(
      id: json['id'],
      orgId: json['orgId'],
      org: json['org'],
      status: json['status'],
      createdAt: json['createdAt'],
      email: json['email']
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "orgId": orgId,
    "org": org,
    "status": status,
    "createdAt": createdAt,
    "email": email
  };
}