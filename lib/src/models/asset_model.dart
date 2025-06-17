class AssetModel {
  final String name;
  final String ticker;
  final String type;
  final int quantity;
  final double averagePrice;

  AssetModel({
    required this.name,
    required this.ticker,
    required this.type,
    required this.quantity,
    required this.averagePrice,
  });

  factory AssetModel.fromJson(Map<String, dynamic> json) {
    return AssetModel(
      name: json['name'],
      ticker: json['ticker'],
      type: json['type'],
      quantity: json['quantity'],
      averagePrice: json['averagePrice'].toDouble(),
    );
  }
}
