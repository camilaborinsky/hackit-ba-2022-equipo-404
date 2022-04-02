import 'dart:developer' as developer;


import 'package:cashop_frontend/data/api/api_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class CrontuApi {
  CrontuApi(String apiUrl) : _apiHost = apiUrl;

  static final Dio dio = Dio();
  // final Preferences _prefs = Preferences();

  // void saveAuthToken(String token) {
  //   developer.log("AuthApi :: saveAuthToken($token)");
  //   _prefs.token = token;
  //   if (kIsWeb) {
  //     CookieManager.instance?.setTokenCookie(token);
  //   }
  // }

  // String getAuthToken() {
  //   return _prefs.token;
  // }

  // void clearAuthToken() {
  //   developer.log("AuthApi :: clearAuthToken()");
  //   _prefs.clear();
  // }

  String getApiUrl() => _apiHost;

  final String _apiHost;

  Future<ApiResponse<T>> get<T>({
    required String url,
    required T Function(Map<String, dynamic> data) mapper,
    bool secured = true,
    bool chat = false,
  }) async {
    // developer.log(
    //     "CrontuApi :: Start :: get(${_apiHost + url}) :: Excecuting with token ${getAuthToken()}");

    return dio
        .get<Map<String, dynamic>>(
      _apiHost + url,
      options: _getRequestOptions(secured: secured),
    )
        .then(
      (dynamic response) {
        developer.log("CrontuApi :: Success :: get($url) :: $response");
        // Logger.d("LabbiGoApi :: Success :: get($url) :: NO LOG RESPONSE");
        return ApiResponse<T>.fromJson(
            response.data as Map<String, dynamic>, mapper);
      },
    ).catchError((Object e) {
      if (e is DioError) {
        return ApiResponse<T>.fromError(e);
      } else {
        developer.log("CrontuApi :: Unhandled Error :: get($url) :: $e");
        throw e;
      }
    });
  }

  Future<ApiResponse<T>> post<T>({
    required String url,
    required dynamic body,
    required T Function(Map<String, dynamic> data) mapper,
    bool secured = true,
    bool chat = false,
  }) async {
    // developer.log(
    //     "CrontuApi :: Start :: post($url) :: Excecuting with token ${getAuthToken()}");
    developer
        .log("CrontuApi :: Body :: post($url) :: body => ${body.toString()}");

    return dio
        .post<Map<String, dynamic>>(
      _apiHost + url,
      data: body,
      options: _getRequestOptions(secured: secured),
    )
        .then(
      (dynamic response) {
        developer
            .log("CrontuApi :: Success :: post($url) :: Response: $response");
        return ApiResponse<T>.fromJson(
            response.data as Map<String, dynamic>, mapper);
      },
    ).catchError((Object error) {
      if (error is DioError) {
        return ApiResponse<T>.fromError(error);
      } else {
        developer.log("CrontuApi :: Unhandled Error :: post($url) :: $error");
        throw error;
      }
    });
  }

  Future<ApiResponse<T>> delete<T>({
    required String url,
    required T Function(Map<String, dynamic> data) mapper,
    bool secured = true,
    bool chat = false,
  }) async {
    // developer.log(
    //     "CrontuApi :: Start :: delete($url) :: Excecuting with token ${getAuthToken()}");

    return dio
        .delete<Map<String, dynamic>>(
      _apiHost + url,
      options: _getRequestOptions(secured: secured),
    )
        .then(
      (dynamic response) {
        developer
            .log("CrontuApi :: Success :: delete($url) :: Response: $response");
        return ApiResponse<T>.fromJson(
            response.data as Map<String, dynamic>, mapper);
      },
    ).catchError((Object error) {
      if (error is DioError) {
        return ApiResponse<T>.fromError(error);
      } else {
        developer.log("CrontuApi :: Unhandled Error :: delete($url) :: $error");
        throw error;
      }
    });
  }

  Future<ApiResponse<T>> put<T>({
    required String url,
    required dynamic body,
    required T Function(Map<String, dynamic> data) mapper,
    bool secured = true,
    bool chat = false,
  }) async {
    // developer.log(
    //     "CrontuApi :: Start :: put($url) :: Excecuting with token ${getAuthToken()}");
    developer
        .log("CrontuApi :: Body :: put($url) :: body => ${body.toString()}");

    return dio
        .put<Map<String, dynamic>>(
      _apiHost + url,
      data: body,
      options: _getRequestOptions(secured: secured),
    )
        .then(
      (dynamic response) {
        developer
            .log("CrontuApi :: Success :: put($url) :: Response: $response");
        return ApiResponse<T>.fromJson(
            response.data as Map<String, dynamic>, mapper);
      },
    ).catchError((Object error) {
      if (error is DioError) {
        return ApiResponse<T>.fromError(error);
      } else {
        developer.log("CrontuApi :: Unhandled Error :: put($url) :: $error");
        throw error;
      }
    });
  }

  Options _getRequestOptions({required bool secured}) {
    // Logger.d("LabbiGoApi :: _getRequestOptions :: Secured: $secured");
    final Map<String, String> requestHeaders = <String, String>{
      // if (secured) 'Authorization': 'Bearer ${getAuthToken()}'
    };
    if (secured) {
      return Options(
        headers: requestHeaders,
        responseType: ResponseType.json,
      );
    } else {
      return Options(responseType: ResponseType.json);
    }
  }
}
