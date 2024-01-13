import 'dart:convert';

UserContainer userContainerFromMap(String str) => UserContainer.fromMap(json.decode(str));

String userContainerToMap(UserContainer data) => json.encode(data.toMap());

class UserContainer {
  final int id;
  final String name;
  final String thumbnail;
  final bool isAvailable;
  final bool hasCamera;
  final bool hasShelves;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int size;
  final int location;

  UserContainer({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.isAvailable,
    required this.hasCamera,
    required this.hasShelves,
    required this.createdAt,
    required this.updatedAt,
    required this.size,
    required this.location,
  });

  factory UserContainer.fromMap(Map<String, dynamic> json) => UserContainer(
        id: json["id"],
        name: json["name"],
        thumbnail: json["thumbnail"],
        isAvailable: json["is_available"],
        hasCamera: json["has_camera"],
        hasShelves: json["has_shelves"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        size: json["size"],
        location: json["location"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "thumbnail": thumbnail,
        "is_available": isAvailable,
        "has_camera": hasCamera,
        "has_shelves": hasShelves,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "size": size,
        "location": location,
      };
}
