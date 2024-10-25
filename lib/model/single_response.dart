class SingleResponse<T> {
  String? status;
  String? message;
  T? data;

  SingleResponse({this.status, this.message, this.data});

  factory SingleResponse.fromJson(
    Map<String, dynamic> json,
    Function(Map<String, dynamic>) create,
  ) {
    return SingleResponse<T>(
      status: json["status"],
      message: json["message"],
      data: json["data"] != null ? create(json["data"]) : null,
    );
  }
}
