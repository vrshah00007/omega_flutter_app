class ProfileDetailModelResponse {
  String? profitLoss;
  String? name;
  String? email;
  String? contactNo;
  String? accountNumber;
  String? ifscCode;
  String? panNo;
  String? addharNo;
  String? city;
  String? state;
  int? amount;
  WalletData? walletData;

  ProfileDetailModelResponse(
      {this.profitLoss,
      this.name,
      this.email,
      this.contactNo,
      this.accountNumber,
      this.ifscCode,
      this.panNo,
      this.addharNo,
      this.city,
      this.state,
      this.amount,
      this.walletData});

  ProfileDetailModelResponse.fromJson(Map<String, dynamic> json) {
    profitLoss = json['profit_loss'];
    name = json['name'];
    email = json['email'];
    contactNo = json['contact_no'];
    accountNumber = json['account_number'];
    ifscCode = json['ifsc_code'];
    panNo = json['pan_no'];
    addharNo = json['addhar_no'];
    city = json['city'];
    state = json['state'];
    amount = json['amount'];
    walletData = json['wallet_data'] != null
        ? WalletData.fromJson(json['wallet_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profit_loss'] = profitLoss;
    data['name'] = name;
    data['email'] = email;
    data['contact_no'] = contactNo;
    data['account_number'] = accountNumber;
    data['ifsc_code'] = ifscCode;
    data['pan_no'] = panNo;
    data['addhar_no'] = addharNo;
    data['city'] = city;
    data['state'] = state;
    data['amount'] = amount;
    if (walletData != null) {
      data['wallet_data'] = walletData!.toJson();
    }
    return data;
  }
}

class WalletData {
  String? userId;
  String? email;
  String? mono;
  String? status;
  String? city;
  String? password;
  String? country;
  String? userName;
  String? bankAccountNo;
  String? ifsc;
  String? docId;
  String? docNo;
  String? panNo;
  String? state;
  String? documentType;
  String? documentFrontImage;
  String? documentBackImage;
  String? bankName;
  String? upiId;
  Null? app;
  String? walletId;
  String? amountt;
  String? profit;
  String? balance;

  WalletData(
      {this.userId,
      this.email,
      this.mono,
      this.status,
      this.city,
      this.password,
      this.country,
      this.userName,
      this.bankAccountNo,
      this.ifsc,
      this.docId,
      this.docNo,
      this.panNo,
      this.state,
      this.documentType,
      this.documentFrontImage,
      this.documentBackImage,
      this.bankName,
      this.upiId,
      this.app,
      this.walletId,
      this.amountt,
      this.profit,
      this.balance});

  WalletData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    email = json['email'];
    mono = json['mono'];
    status = json['status'];
    city = json['city'];
    password = json['password'];
    country = json['country'];
    userName = json['user_name'];
    bankAccountNo = json['bank_account_no'];
    ifsc = json['ifsc'];
    docId = json['doc_id'];
    docNo = json['doc_no'];
    panNo = json['pan_no'];
    state = json['state'];
    documentType = json['document_type'];
    documentFrontImage = json['document_front_image'];
    documentBackImage = json['document_back_image'];
    bankName = json['bank_name'];
    upiId = json['upi_id'];
    app = json['app'];
    walletId = json['wallet_id'];
    amountt = json['amountt'];
    profit = json['profit'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['email'] = email;
    data['mono'] = mono;
    data['status'] = status;
    data['city'] = city;
    data['password'] = password;
    data['country'] = country;
    data['user_name'] = userName;
    data['bank_account_no'] = bankAccountNo;
    data['ifsc'] = ifsc;
    data['doc_id'] = docId;
    data['doc_no'] = docNo;
    data['pan_no'] = panNo;
    data['state'] = state;
    data['document_type'] = documentType;
    data['document_front_image'] = documentFrontImage;
    data['document_back_image'] = documentBackImage;
    data['bank_name'] = bankName;
    data['upi_id'] = upiId;
    data['app'] = app;
    data['wallet_id'] = walletId;
    data['amountt'] = amountt;
    data['profit'] = profit;
    data['balance'] = balance;
    return data;
  }
}
