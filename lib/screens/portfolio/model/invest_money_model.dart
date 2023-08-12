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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['staus'] = this.staus;
    data['wallet_transaction_id'] = this.walletTransactionId;
    data['msg'] = this.msg;
    return data;
  }
}
