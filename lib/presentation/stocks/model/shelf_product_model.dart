import 'dart:convert';

ShelfProduct shelfProductFromMap(String str) => ShelfProduct.fromMap(json.decode(str));

String shelfProductToMap(ShelfProduct data) => json.encode(data.toMap());

class ShelfProduct {
  final int id;
  final String name;
  final int stockId;
  final int quantityInShelf;

  ShelfProduct({
    required this.id,
    required this.name,
    required this.stockId,
    required this.quantityInShelf,
  });

  factory ShelfProduct.fromMap(Map<String, dynamic> json) => ShelfProduct(
        id: json["id"],
        name: json["name"],
        stockId: json["stock_id"],
        quantityInShelf: json["quantity_in_shelf"],
      );

  factory ShelfProduct.idle() => ShelfProduct(
        id: 0,
        name: '',
        stockId: 0,
        quantityInShelf: 0,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "stock_id": stockId,
        "quantity_in_shelf": quantityInShelf,
      };
}
