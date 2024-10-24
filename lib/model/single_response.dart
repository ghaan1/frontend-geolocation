class SingleResponse<T> {
  int? apiStatus;
  String? apiMessage;
  T? data;

  SingleResponse({this.apiStatus, this.apiMessage, this.data});

  factory SingleResponse.fromJson(
    Map<String, dynamic> json,
    Function(Map<String, dynamic>) create,
  ) {
    return SingleResponse<T>(
      apiStatus: json["api_success"],
      apiMessage: json["api_message"],
      data: json["data"] != null ? create(json["data"]) : null,
    );
  }
}
