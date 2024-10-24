class BaseResponse {
  String? errorStatus;
  String? message;

  BaseResponse({
    this.errorStatus,
    this.message,
    // this.data,
  });

  BaseResponse.fromJson(Map<String, dynamic> json) {
    errorStatus = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = errorStatus;
    data['message'] = message;
    return data;
  }
}
