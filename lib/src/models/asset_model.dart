class AssetModel {
  String ticker;
  String name;
  double close;
  double change;
  int volume;
  int marketCap;
  String logo;
  String sector;
  String type;

  AssetModel({
    required this.ticker,
    required this.name,
    required this.close,
    required this.change,
    required this.volume,
    required this.marketCap,
    required this.logo,
    required this.sector,
    required this.type,
  });

  factory AssetModel.fromJson(Map<String, dynamic> json) {
    return AssetModel(
      ticker: json["stock"] ?? '',
      name: json["name"] ?? '',
      close: (json["close"] ?? 0).toDouble(),
      change: (json["change"] ?? 0).toDouble(),
      volume: (json["volume"] ?? 0).toInt(),
      marketCap: (json["market_cap"] ?? 0).toInt(),
      logo: json["logo"] ?? '',
      sector: json["sector"] ?? '',
      type: json["type"] ?? '',
    );
  }
}
