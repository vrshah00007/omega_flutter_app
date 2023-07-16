class PortfolioDetailModelResponse {
  int? profitLoss;
  String? available;
  int? totalBuy;
  int? totalPortfolio;
  String? withdraw;

  PortfolioDetailModelResponse(
      {this.profitLoss,
        this.available,
        this.totalBuy,
        this.totalPortfolio,
        this.withdraw});

  PortfolioDetailModelResponse.fromJson(Map<String, dynamic> json) {
    profitLoss = json['profit_loss'];
    available = json['available'];
    totalBuy = json['total_buy'];
    totalPortfolio = json['total_portfolio'];
    withdraw = json['withdraw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profit_loss'] = profitLoss;
    data['available'] = available;
    data['total_buy'] = totalBuy;
    data['total_portfolio'] = totalPortfolio;
    data['withdraw'] = withdraw;
    return data;
  }
}
