class OperationModel {
  String ticker;
  String operationType;
  String operationDate;
  int quantity;
  double unitPrice;
  double totalPrice;
  int userId;

  OperationModel({
    required this.ticker,
    required this.operationType,
    required this.operationDate,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
    required this.userId,
  });

  Map<String, dynamic> toJson() => {
    "assetTicker": ticker,
    "operationType": operationType,
    "date": operationDate,
    "quantity": quantity,
    "unitPrice": unitPrice,
    "totalPrice": totalPrice,
    "totalValue": totalPrice,
    "userId": userId,
  };
}
