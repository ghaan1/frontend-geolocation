class ListResponse<T> {
  int? apiStatus;
  String? apiMessage;
  List<T>? data;
  int? lastPage;

  ListResponse({this.apiStatus, this.apiMessage, this.data, this.lastPage});

  factory ListResponse.fromJson(
    Map<String, dynamic> json,
    Function(Map<String, dynamic>) create,
  ) {
    var data = <T>[];
    json['data'].forEach((v) {
      data.add(create(v));
    });

    var pagination = json['pagination'] as Map<String, dynamic>?;

    return ListResponse<T>(
      apiStatus: json["api_status"],
      apiMessage: json["api_message"],
      data: data,
      lastPage: pagination != null ? pagination['last_page'] : null,
    );
  }
}
