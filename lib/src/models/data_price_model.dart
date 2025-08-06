class DataPriceModel {
  DateTime date;
  double open;
  double high;
  double low;
  double close;
  int volume;
  double adjustedClose;

  DataPriceModel({
    required this.date,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
    required this.adjustedClose
  });

  factory DataPriceModel.fromJson(Map<String, dynamic> json) {
    return DataPriceModel(
      date: DateTime.fromMillisecondsSinceEpoch(json['date'] * 1000), 
      open: json["open"].toDouble(), 
      high: json["high"].toDouble(), 
      low: json["low"].toDouble(), 
      close: json["close"].toDouble(), 
      volume: json["volume"].toInt(), 
      adjustedClose: json["adjustedClose"].toDouble()
    );
  }
}