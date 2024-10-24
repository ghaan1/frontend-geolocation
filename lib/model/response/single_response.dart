class SingleResponse<T> {
  int? count;
  String? message;
  T? data;

  SingleResponse({this.count, this.message, this.data});

  factory SingleResponse.fromJson(
    Map<String, dynamic> json,
    Function(Map<String, dynamic>) create,
  ) {
    final data = json["restaurant"];

    print(data);
    return SingleResponse<T>(
      count: json["count"],
      message: json["message"],
      data: json["restaurant"] != null ? create(json["restaurant"]) : null,
    );
  }
}
