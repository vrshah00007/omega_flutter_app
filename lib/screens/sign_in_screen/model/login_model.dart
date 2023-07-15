class LoginModelResponse {
  int? staus;
  String? msg;
  User? user;

  LoginModelResponse({this.staus, this.msg, this.user});

  LoginModelResponse.fromJson(Map<String, dynamic> json) {
    staus = json['staus'];
    msg = json['msg'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['staus'] = staus;
    data['msg'] = msg;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? userId;
  String? email;
  String? mono;
  String? status;
  String? country;
  String? userName;

  User(
      {this.userId,
      this.email,
      this.mono,
      this.status,
      this.country,
      this.userName});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    email = json['email'];
    mono = json['mono'];
    status = json['status'];
    country = json['country'];
    userName = json['user_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['email'] = email;
    data['mono'] = mono;
    data['status'] = status;
    data['country'] = country;
    data['user_name'] = userName;
    return data;
  }
}

class LoginModelRequest {
  String? email;
  String? password;

  LoginModelRequest({this.email, this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "email": email,
      "password": password,
    };
    return map;
  }
}
