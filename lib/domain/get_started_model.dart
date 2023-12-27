import 'dart:convert';

GetStartedModel getStartedFromMap(String str) => GetStartedModel.fromMap(json.decode(str));

String getStartedToMap(GetStartedModel data) => json.encode(data.toMap());

class GetStartedModel {
  final Business business;
  final bool isBusinessRegistered;
  final bool isBusinessApproved;

  GetStartedModel({
    required this.business,
    required this.isBusinessRegistered,
    required this.isBusinessApproved,
  });

  factory GetStartedModel.fromMap(Map<String, dynamic> json) => GetStartedModel(
        business: Business.fromMap(json["business"]),
        isBusinessRegistered: json["is_business_registered"],
        isBusinessApproved: json["is_business_approved"],
      );

  Map<String, dynamic> toMap() => {
        "business": business.toMap(),
        "is_business_registered": isBusinessRegistered,
        "is_business_approved": isBusinessApproved,
      };
}

class Business {
  final int id;
  final String uid;
  final String name;
  final String type;
  final String location;
  final dynamic description;
  final String taxNumber;
  final bool isApproved;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int owner;

  Business({
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

  factory Business.fromMap(Map<String, dynamic> json) => Business(
        id: json["id"],
        uid: json["uid"],
        name: json["name"],
        type: json["type"],
        location: json["location"],
        description: json["description"],
        taxNumber: json["tax_number"],
        isApproved: json["is_approved"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        owner: json["owner"],
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
