class ListResponse<T> {
  int? count;
  String? message;
  List<T>? data;

  ListResponse({this.count, this.message, this.data});

  factory ListResponse.fromJson(
    Map<String, dynamic> json,
    Function(Map<String, dynamic>) create,
  ) {
    var data = <T>[];
    json['restaurants'].forEach((v) {
      data.add(create(v));
    });

    return ListResponse<T>(
      count: json["count"],
      message: json["message"],
      data: data,
    );
  }
}
