class ApiForgeQuotesResponseModel {
  double? p;
  double? a;
  double? b;
  String? s;
  int? t;

  ApiForgeQuotesResponseModel({this.p, this.a, this.b, this.s, this.t});

  ApiForgeQuotesResponseModel.fromJson(Map<String, dynamic> json) {
    p = json['p'];
    a = json['a'];
    b = json['b'];
    s = json['s'];
    t = json['t'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['p'] = p;
    data['a'] = a;
    data['b'] = b;
    data['t'] = t;
    return data;
  }
}
