import 'package:flutter/material.dart';

class Invite {

  final int id;
  final int orgId;
  final String org;
  final bool? status;
  final String createdAt;

  Invite({
    required this.id,
    required this.orgId,
    required this.org,
    required this.createdAt,
    required this.status
  });

  factory Invite.fromJson(Map<String, dynamic> json) {
    return Invite(
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