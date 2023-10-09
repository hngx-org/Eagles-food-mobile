
class OrgRequest {
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