import 'package:flutter/material.dart';
// "id": 3,
// "orgId": 2,
// "org": "Eagles Food",
// "createdAt": "2023-10-03T14:14:13"
class Invite {

  final int id;
  final int orgId;
  final String org;
  final String createdAt;

  Invite({
    required this.id,
    required this.orgId,
    required this.org,
    required this.createdAt,
  });

  factory Invite.fromJson(Map<String, dynamic> json) {
    return Invite(
      id: json['id'],
      orgId: json['orgId'],
      org: json['org'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "orgId": orgId,
    "org": org,
    "createdAt": createdAt,
  };

}