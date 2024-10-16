class ErrorResponse {
  ErrorResponse({
    this.status = false,
    this.message ,
    this.errors,
  });

  ErrorResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    errors = json['errors'] != null ? json['errors'].cast<String>() : [];
  }

  bool? status;
  String? message;
  List<String>? errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['errors'] = errors;
    return map;
  }
}
