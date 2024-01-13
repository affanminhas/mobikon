import 'dart:convert';

Shelf shelfFromMap(String str) => Shelf.fromMap(json.decode(str));

String shelfToMap(Shelf data) => json.encode(data.toMap());

class Shelf {
  final int id;
  final String name;

  Shelf({
    required this.id,
    required this.name,
  });

  factory Shelf.fromMap(Map<String, dynamic> json) => Shelf(
        id: json["id"],
        name: json["name"],
      );

  factory Shelf.idle() => Shelf(
        id: 0,
        name: '',
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}
