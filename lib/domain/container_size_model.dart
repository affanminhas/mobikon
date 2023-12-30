import 'dart:convert';

ContainerSize containerSizeFromMap(String str) => ContainerSize.fromMap(json.decode(str));

class ContainerSize {
  final int id;
  final String size;

  ContainerSize({
    required this.id,
    required this.size,
  });

  factory ContainerSize.fromMap(Map<String, dynamic> json) => ContainerSize(
        id: json["id"],
        size: json["size"],
      );
}
