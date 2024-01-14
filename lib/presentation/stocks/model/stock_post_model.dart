class StockPost {
  final int stock;
  final int shelf;
  final int quantity;
  final String type;
  final String? productName;
  final String? shelfName;

  StockPost({
    required this.stock,
    required this.shelf,
    required this.quantity,
    required this.type,
    this.productName,
    this.shelfName,
  });

  factory StockPost.fromMap(Map<String, dynamic> json) => StockPost(
        stock: json["stock"],
        shelf: json["shelf"],
        quantity: json["units_quantity"],
        type: json["type"],
      );

  factory StockPost.idle() => StockPost(
        stock: 0,
        shelf: 0,
        quantity: 0,
        type: '',
      );

  Map<String, dynamic> toMap() => {
        "stock": stock,
        "shelf": shelf,
        "units_quantity": quantity,
        "type": type,
      };
}
