class HomeTableModel {

  final String ticker;
  final double dailyVariation;
  final double totalVariation;


  HomeTableModel({
    required this.ticker,
    required this.dailyVariation,
    required this.totalVariation,
  });

  factory HomeTableModel.fromJson(Map<String, dynamic> json) {
    return HomeTableModel(
      ticker: json["ticker"],
      dailyVariation: json["dailyVariation"],
      totalVariation: json["totalVariation"],
    );
  }
}
