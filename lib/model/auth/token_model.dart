class TokenModel {
  String? accessToken;
  int? expiry;

  TokenModel({this.accessToken, this.expiry});

  TokenModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    expiry = json['expiry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['expiry'] = expiry;
    return data;
  }
}
