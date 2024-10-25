class TokenModel {
  String? token;
  int? expiry;

  TokenModel({this.token, this.expiry});

  TokenModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiry = json['expiry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['expiry'] = expiry;
    return data;
  }
}
