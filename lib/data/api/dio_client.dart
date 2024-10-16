import 'package:dealse/data/model/error_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide Response, FormData;
import 'package:get_storage/get_storage.dart';
import '../../routes/app_pages.dart';
import '../../utils/utility.dart';
import '../constants.dart';
import 'logging.dart';

class DioClient extends GetxService {
  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: Constants.baseUrl, headers: {'Accept': 'application/json'}),
  )..interceptors.add(Logging());

  void logError(DioException e) {
    if (e.response != null) {
      if (kDebugMode) {
        print('Dio error!');
        print('URL: ${e.response?.requestOptions.baseUrl}');
        print('HEADERS: ${e.response?.requestOptions.headers}');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data.message}');
      }
    } else {
      if (kDebugMode) {
        print('Error sending request!');
        print(e.message);
      }
    }
  }

  Future<Response?> get(String url,
      {Map<String, dynamic>? queryParams, Map<String, dynamic>? params}) async {
    Response? response;
    try {
      Response data = await _dio.get(url,
          queryParameters: queryParams ?? {},
          data: params ?? {},
          options: Options(headers: {
            "Authorization":
                "Bearer ${GetStorage().read(Constants.accessToken) ?? ''}",
          }));
      if (data.statusCode == 401) {
        await GetStorage().erase();
        Get.offAllNamed(Routes.login);
      }else if (data.statusCode == 404) {
        Utility.showToastMessage(data.statusMessage);
      }
      response = data;
    } on DioException catch (e) {
      logError(e);
      if (e.response?.statusCode == 401) {
        await GetStorage().erase();
        Get.offAllNamed(Routes.login);
      }
      response = e.response;
    }
    return response;
  }

  Future<Response?> post(String url,
      {Map<String, dynamic>? params, Map<String, dynamic>? queryParams}) async {
    Response? response;
    try {
      Response data = await _dio.post(url,
          data: params ?? {},
          queryParameters: queryParams ?? {},
          options: Options(headers: {
            "Authorization":
                "Bearer ${GetStorage().read(Constants.accessToken) ?? ''}"
          }));
      if (data.statusCode == 401) {
        await GetStorage().erase();
        Get.offAllNamed(Routes.login);
      }
      response = data;
    } on DioException catch (e) {
      final errorMessage = e.response?.data['message'];
      Utility.showToastMessage(errorMessage ?? 'Unknown error occurred');
      if (e.response?.statusCode == 401) {
        await GetStorage().erase();
        Get.offAllNamed(Routes.login);
      }
      else if (e.response?.statusCode == 400) {
      } else if (e.response?.statusCode == 404) {
      }
      response = e.response;
    }
    return response;
  }

  Future<Response?> delete(String url,
      {Map<String, dynamic>? params, Map<String, dynamic>? queryParams}) async {
    Response? response;
    try {
      Response data = await _dio.delete(url,
          data: params ?? {},
          queryParameters: queryParams ?? {},
          options: Options(headers: {
            "Authorization":
                "Bearer ${GetStorage().read(Constants.accessToken) ?? ''}"
          }));
      if (data.statusCode == 401) {
        await GetStorage().erase();
        Get.offAllNamed(Routes.login);
      }
      response = data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        await GetStorage().erase();
        Get.offAllNamed(Routes.login);
      }
      response = e.response;
    }
    return response;
  }

  Future<dynamic> put(String url, {Map<String, dynamic>? params}) async {
    dynamic response;
    try {
      Response data = await _dio.put(url,
          data: params ?? {},
          options: Options(headers: {
            "Authorization":
                "Bearer ${GetStorage().read(Constants.accessToken) ?? ''}"
          }));
      if (data.statusCode == 401) {
        await GetStorage().erase();
        Get.offAllNamed(Routes.login);
      }
      response = data.data;
    } on DioException catch (e) {
      logError(e);
      if (e.response?.statusCode == 401) {
        await GetStorage().erase();
        Get.offAllNamed(Routes.login);
      }
      response = e.response?.data;
    }
    return response;
  }

  Future<dynamic> putMultiPart(String url,
      {Map<String, dynamic>? params}) async {
    dynamic response;
    try {
      FormData formData = FormData.fromMap(params ?? {});
      Response data = await _dio.put(url,
          data: formData,
          options: Options(headers: {
            "Authorization":
                "Bearer ${GetStorage().read(Constants.accessToken) ?? ''}"
          }));
      if (data.statusCode == 401) {
        await GetStorage().erase();
        Get.offAllNamed(Routes.login);
      }
      response = data.data;
    } on DioException catch (e) {
      logError(e);
      if (e.response?.statusCode == 401) {
        await GetStorage().erase();
        Get.offAllNamed(Routes.login);
      }
      response = e.response?.data;
    }
    return response;
  }

  Future<dynamic> postMultiPart(String url,
      {Map<String, dynamic>? params}) async {
    dynamic response;
    try {
      FormData formData = FormData.fromMap(params ?? {});
      Response data = await _dio.post(url,
          data: formData,
          options: Options(headers: {
            "Authorization":
                "Bearer ${GetStorage().read(Constants.accessToken) ?? ''}"
          }));
      if (data.statusCode == 401) {
        await GetStorage().erase();
        Get.offAllNamed(Routes.login);
      }
      response = data.data;
    } on DioException catch (e) {
      logError(e);
      if (e.response?.statusCode == 401) {
        await GetStorage().erase();
        Get.offAllNamed(Routes.login);
      }
      response = e.response?.data;
    }
    return response;
  }
}
