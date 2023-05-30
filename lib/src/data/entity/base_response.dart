class BaseResponse<T> {
  final int code;
  final String message;
  final dynamic data;

  BaseResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse<T>(
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
      "data": data,
    };
  }
}
