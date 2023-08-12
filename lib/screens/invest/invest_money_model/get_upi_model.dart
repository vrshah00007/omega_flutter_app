class GetUpiResponseModel {
  int? staus;
  String? msg;
  String? image;
  String? upi;
  String? bankName;
  String? bankAcNumber;
  String? ifscCode;

  GetUpiResponseModel(
      {this.staus,
        this.msg,
        this.image,
        this.upi,
        this.bankName,
        this.bankAcNumber,
        this.ifscCode});

  GetUpiResponseModel.fromJson(Map<String, dynamic> json) {
    staus = json['staus'];
    msg = json['msg'];
    image = json['image'];
    upi = json['upi'];
    bankName = json['bank_name'];
    bankAcNumber = json['bank_ac_number'];
    ifscCode = json['ifsc_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['staus'] = this.staus;
    data['msg'] = this.msg;
    data['image'] = this.image;
    data['upi'] = this.upi;
    data['bank_name'] = this.bankName;
    data['bank_ac_number'] = this.bankAcNumber;
    data['ifsc_code'] = this.ifscCode;
    return data;
  }
}
