import 'dart:ui';

class APIError {
  late String error;
  late dynamic message;
  late int status;
  late VoidCallback onAlertPop;

  APIError({required this.error, required this.status, required this.message, required this.onAlertPop});

  APIError.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}
