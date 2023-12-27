import 'dart:convert';

BusinessInfo businessInfoFromMap(String str) => BusinessInfo.fromMap(json.decode(str));

String businessInfoToMap(BusinessInfo data) => json.encode(data.toMap());

class BusinessInfo {
  final int id;
  final String uid;
  final String name;
  final String type;
  final String location;
  final String description;
  final String taxNumber;
  final bool isApproved;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int owner;

  BusinessInfo({
    required this.id,
    required this.uid,
    required this.name,
    required this.type,
    required this.location,
    required this.description,
    required this.taxNumber,
    required this.isApproved,
    required this.createdAt,
    required this.updatedAt,
    required this.owner,
  });

  factory BusinessInfo.fromMap(Map<String, dynamic> json) => BusinessInfo(
        id: json["id"] ?? '',
        uid: json["uid"] ?? '',
        name: json["name"] ?? '',
        type: json["type"] ?? '',
        location: json["location"] ?? '',
        description: json["description"] ?? 'No description',
        taxNumber: json["tax_number"] ?? '',
        isApproved: json["is_approved"] ?? '',
        createdAt: DateTime.parse(json["created_at"] ?? DateTime.now()),
        updatedAt: DateTime.parse(json["updated_at"] ?? DateTime.now()),
        owner: json["owner"] ?? '',
      );

  factory BusinessInfo.idle() => BusinessInfo(
        id: 0,
        uid: '',
        name: '',
        type: '',
        location: '',
        description: '',
        taxNumber: '',
        isApproved: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        owner: 0,
      );

  factory BusinessInfo.copyWith(BusinessInfo businessInfo) => BusinessInfo(
        id: businessInfo.id,
        uid: businessInfo.uid,
        name: businessInfo.name,
        type: businessInfo.type,
        location: businessInfo.location,
        description: businessInfo.description,
        taxNumber: businessInfo.taxNumber,
        isApproved: businessInfo.isApproved,
        createdAt: businessInfo.createdAt,
        updatedAt: businessInfo.updatedAt,
        owner: businessInfo.owner,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "uid": uid,
        "name": name,
        "type": type,
        "location": location,
        "description": description,
        "tax_number": taxNumber,
        "is_approved": isApproved,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "owner": owner,
      };
}
