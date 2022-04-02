import 'dart:developer' as developer;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class ApiResponse<T> extends Equatable {
  const ApiResponse({
    required this.url,
    this.data,
    this.error = false,
    required this.message,
    required this.statusCode,
    this.exception,
  });

  factory ApiResponse.fromError(DioError error) {
    developer.log(
        "ApiResponse.fromError :: Error '$error' with status [${error.response}]");
    return ApiResponse<T>(
      url:
          "${error.requestOptions.path}/${error.requestOptions.queryParameters}",
      error: true,
      message: "Response with status code [${error.response?.statusCode}]",
      statusCode: error.response?.statusCode ?? 500,
      exception: error,
    );
  }

  factory ApiResponse.fromJson(Map<String, dynamic> json,
          T Function(Map<String, dynamic> data) mapper) =>
      ApiResponse<T>(
        url: '',
        error: json['error'] as bool,
        message: json['message'] as String,
        data: mapper(<String, dynamic>{"data": json['data']}),
        statusCode: HttpStatus.ok,
      );

  final String url;
  final T? data;
  final bool error;
  final String message;
  final int statusCode;
  final Exception? exception;

  bool get success {
    return !error;
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'url': url,
        'error': error,
        'data': data,
        'message': message,
        'statusCode': statusCode,
        'exception': exception.toString(),
      };

  @override
  List<Object?> get props =>
      <Object?>[url, error, data, message, statusCode, exception];
}
