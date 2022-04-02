import 'dart:developer' as developer;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class ApiResponse<T> extends Equatable {
  const ApiResponse({
    required this.url,
    this.data,
    required this.statusCode,
  });

  factory ApiResponse.fromError(DioError error) {
    developer.log(
        "ApiResponse.fromError :: Error '$error' with status [${error.response}]");
    return ApiResponse<T>(
      url:
          "${error.requestOptions.path}/${error.requestOptions.queryParameters}",
      
      statusCode: error.response?.statusCode ?? 500,
    );
  }

  factory ApiResponse.fromJson(Map<String, dynamic> json,
          T Function(Map<String, dynamic> data) mapper) =>
      ApiResponse<T>(
        url: '',
        data: mapper(<String, dynamic>{"data": json['data']}),
        statusCode: HttpStatus.ok,
      );

  final String url;
  final T? data;
  final int statusCode;

  bool get success {
    return statusCode <300 && statusCode >=200;
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'url': url,
        'data': data,
        'statusCode': statusCode,
      };

  @override
  List<Object?> get props =>
      <Object?>[url, data, statusCode];
}
