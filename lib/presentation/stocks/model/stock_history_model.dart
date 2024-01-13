import 'dart:convert';

StockHistory stockHistoryFromMap(String str) => StockHistory.fromMap(json.decode(str));

String stockHistoryToMap(StockHistory data) => json.encode(data.toMap());

class StockHistory {
  final List<StockHistoryRecord> records;
  final StockHistorySummary summary;

  StockHistory({
    required this.records,
    required this.summary,
  });

  factory StockHistory.fromMap(Map<String, dynamic> json) => StockHistory(
        records: List<StockHistoryRecord>.from(json["records"].map((x) => StockHistoryRecord.fromMap(x))),
        summary: StockHistorySummary.fromMap(json["summary"]),
      );

  factory StockHistory.idle() => StockHistory(
        records: [],
        summary: StockHistorySummary(
          totalProducts: 0,
          totalUnitsAdded: 0,
          totalUnitsReduced: 0,
          totalUnitsPresent: 0,
          totalRecordCount: 0,
        ),
      );

  Map<String, dynamic> toMap() => {
        "records": List<dynamic>.from(records.map((x) => x.toMap())),
        "summary": summary.toMap(),
      };
}

class StockHistoryRecord {
  final int id;
  final StockHistoryProduct product;
  final String type;
  final int quantity;
  final String createdBy;
  final String shelf;
  final String createdAt;
  final int storedInContainer;

  StockHistoryRecord({
    required this.id,
    required this.product,
    required this.type,
    required this.quantity,
    required this.createdBy,
    required this.shelf,
    required this.createdAt,
    required this.storedInContainer,
  });

  factory StockHistoryRecord.fromMap(Map<String, dynamic> json) => StockHistoryRecord(
        id: json["id"],
        product: StockHistoryProduct.fromMap(json["product"]),
        type: json["type"],
        quantity: json["quantity"],
        createdBy: json["created_by"],
        shelf: json["shelf"],
        createdAt: json["created_at"],
        storedInContainer: json["stored_in_container"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "product": product.toMap(),
        "type": type,
        "quantity": quantity,
        "created_by": createdBy,
        "shelf": shelf,
        "created_at": createdAt,
        "stored_in_container": storedInContainer,
      };
}

class StockHistoryProduct {
  final int id;
  final String name;
  final String thumbnail;

  StockHistoryProduct({
    required this.id,
    required this.name,
    required this.thumbnail,
  });

  factory StockHistoryProduct.fromMap(Map<String, dynamic> json) => StockHistoryProduct(
        id: json["id"],
        name: json["name"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "thumbnail": thumbnail,
      };
}

class StockHistorySummary {
  final int totalProducts;
  final int totalUnitsAdded;
  final int totalUnitsReduced;
  final int totalUnitsPresent;
  final int totalRecordCount;

  StockHistorySummary({
    required this.totalProducts,
    required this.totalUnitsAdded,
    required this.totalUnitsReduced,
    required this.totalUnitsPresent,
    required this.totalRecordCount,
  });

  factory StockHistorySummary.fromMap(Map<String, dynamic> json) => StockHistorySummary(
        totalProducts: json["total_products"],
        totalUnitsAdded: json["total_units_added"],
        totalUnitsReduced: json["total_units_reduced"],
        totalUnitsPresent: json["total_units_present"],
        totalRecordCount: json["total_record_count"],
      );

  Map<String, dynamic> toMap() => {
        "total_products": totalProducts,
        "total_units_added": totalUnitsAdded,
        "total_units_reduced": totalUnitsReduced,
        "total_units_present": totalUnitsPresent,
        "total_record_count": totalRecordCount,
      };
}
