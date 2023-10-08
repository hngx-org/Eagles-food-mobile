
class OrgRequest {
  final int id;
  final int orgId;
  final String org;
  final bool? status;
  final String createdAt;

  OrgRequest({
    required this.id,
    required this.orgId,
    required this.org,
    required this.createdAt,
    required this.status
  });

  factory OrgRequest.fromJson(Map<String, dynamic> json) {
    return OrgRequest(
      id: json['id'],
      orgId: json['orgId'],
      org: json['org'],
      status: json['status'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "orgId": orgId,
    "org": org,
    "status": status,
    "createdAt": createdAt,
  };
}