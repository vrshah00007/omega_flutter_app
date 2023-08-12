class SignUpResponseModel {
  int? staus;
  String? msg;
  int? user;

  SignUpResponseModel({this.staus, this.msg, this.user});

  SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    staus = json['staus'];
    msg = json['msg'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['staus'] = this.staus;
    data['msg'] = this.msg;
    data['user'] = this.user;
    return data;
  }
}

class SignUpRequestModel {
  String? userName;
  String? email;
  String? mono;
  String? city;
  String? state;
  String? country;
  String? panCardNo;
  String? bankName;
  String? bankAccount;
  String? ifsc;
  String? upiID;
  String? password;
  String? docNo;
  String? gender;

  SignUpRequestModel(
      {this.userName,
      this.email,
      this.mono,
      this.city,
      this.state,
      this.country,
      this.panCardNo,
      this.bankName,
      this.bankAccount,
      this.ifsc,
      this.upiID,
      this.password,
      this.docNo,
      this.gender});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'user_name': userName,
      'email': email,
      'mono': mono,
      'city': city,
      'state': state,
      'country': country,
      'pancard_no': panCardNo,
      'bank_name': bankName,
      'bank_account': bankAccount,
      'ifsc': ifsc,
      'upi_id': upiID,
      'password': password,
      'doc_no': docNo,
      'gender': gender,
    };
    return map;
  }
}
