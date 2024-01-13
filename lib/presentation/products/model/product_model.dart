import 'dart:convert';

Product productFromMap(String str) => Product.fromMap(json.decode(str));

String productToMap(Product data) => json.encode(data.toMap());

class Product {
  final int id;
  final String name;
  final int quantity;
  final String description;
  final String type;
  final int quantityInShelf;
  final String thumbnail;
  final String productId;

  Product({
    required this.id,
    required this.name,
    required this.quantity,
    required this.quantityInShelf,
    this.description = '',
    this.type = '',
    required this.thumbnail,
    this.productId = '',
  });

  factory Product.initial() => Product(
        id: 0,
        name: '',
        quantity: 0,
        quantityInShelf: 0,
        thumbnail: '',
      );

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        quantity: json["quantity"] ?? 0,
        quantityInShelf: json["quantity_in_shelf"] ?? 0,
        thumbnail: json["thumbnail"] ?? '',
        description: json.containsKey('description') ? json["description"] ?? '' : '',
        type: json.containsKey('type') ? json["type"] ?? '' : '',
        productId: json.containsKey('product_number') ? json["product_number"] ?? 'Not Set' : 'Not Set',
      );

  Map<String, String> toMap() => {
        "name": name,
        "description": description,
        "type": type,
        "thumbnail": thumbnail,
        "productId": productId,
      };

  Map<String, String> updateProductMap() => {
        "name": name,
        "description": description,
        "type": type,
        "productId": productId,
      };
}
