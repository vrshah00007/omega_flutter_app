class TransactionListResponseModel {
  List<Data>? data;
  int? invest;
  int? withdrawal;
  int? profit;
  int? loss;

  TransactionListResponseModel(
      {this.data, this.invest, this.withdrawal, this.profit, this.loss});

  TransactionListResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    invest = json['invest'];
    withdrawal = json['withdrawal'];
    profit = json['profit'];
    loss = json['loss'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['invest'] = invest;
    data['withdrawal'] = withdrawal;
    data['profit'] = profit;
    data['loss'] = loss;
    return data;
  }
}

class Data {
  String? buySellId;
  String? currencyId;
  String? userId;
  String? date;
  String? ask;
  String? amount;
  String? total;
  String? buySell;
  String? currencyName;
  String? orderId;
  String? sell;
  String? profitLossType;
  String? profitLossAmount;
  String? qty;

  Data(
      {this.buySellId,
      this.currencyId,
      this.userId,
      this.date,
      this.ask,
      this.amount,
      this.total,
      this.buySell,
      this.currencyName,
      this.orderId,
      this.sell,
      this.profitLossType,
      this.profitLossAmount,
      this.qty});

  Data.fromJson(Map<String, dynamic> json) {
    buySellId = json['buy_sell_id'];
    currencyId = json['currency_id'];
    userId = json['user_id'];
    date = json['date'];
    ask = json['ask'];
    amount = json['amount'];
    total = json['total'];
    buySell = json['buy_sell'];
    currencyName = json['currency_name'];
    orderId = json['order_id'];
    sell = json['sell'];
    profitLossType = json['profit_loss_type'];
    profitLossAmount = json['profit_loss_amount'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['buy_sell_id'] = buySellId;
    data['currency_id'] = currencyId;
    data['user_id'] = userId;
    data['date'] = date;
    data['ask'] = ask;
    data['amount'] = amount;
    data['total'] = total;
    data['buy_sell'] = buySell;
    data['currency_name'] = currencyName;
    data['order_id'] = orderId;
    data['sell'] = sell;
    data['profit_loss_type'] = profitLossType;
    data['profit_loss_amount'] = profitLossAmount;
    data['qty'] = qty;
    return data;
  }
}
