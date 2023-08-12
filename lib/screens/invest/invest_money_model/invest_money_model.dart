class InvestMoneyResponseModel {
  int? staus;
  int? walletTransactionId;
  String? msg;

  InvestMoneyResponseModel({this.staus, this.walletTransactionId, this.msg});

  InvestMoneyResponseModel.fromJson(Map<String, dynamic> json) {
    staus = json['staus'];
    walletTransactionId = json['wallet_transaction_id'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['staus'] = staus;
    data['wallet_transaction_id'] = walletTransactionId;
    data['msg'] = msg;
    return data;
  }
}

class InvestMoneyRequestModel {
  String? amount;
  String? type;
  String? id;

  InvestMoneyRequestModel({
    this.amount,
    this.type,
    this.id,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "amount": amount,
      "type": type,
      "id": id,
    };
    return map;
  }
}
