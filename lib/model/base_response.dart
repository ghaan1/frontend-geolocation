class BaseResponse {
  int? apiStatus;
  String? apiMessage;

  BaseResponse({
    this.apiStatus,
    this.apiMessage,
    // this.data,
  });

  BaseResponse.fromJson(Map<String, dynamic> json) {
    apiStatus = json['api_status'];
    apiMessage = json['api_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['api_status'] = apiStatus;
    data['api_message'] = apiMessage;
    return data;
  }
}