import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_engineering_3/core/utils/static.dart';

class ApiService {
  static final _baseUrl = "http://${Static.ipconfig}/api/";

  static final dio =
      Dio(
          BaseOptions(
            baseUrl: _baseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            sendTimeout: const Duration(seconds: 10),
            contentType: 'application/json',
            headers: {'Content-Type': 'application/json'},
          ),
        )
        ..httpClientAdapter = IOHttpClientAdapter(
          createHttpClient: () {
            final HttpClient client = HttpClient();
            client.badCertificateCallback =
                (X509Certificate cert, String host, int port) => true;
            return client;
          },
        );

  static Future<Map<String, String>> _headers() async {
    final sp = await SharedPreferences.getInstance();
    final token = sp.getString('token') ?? "";

    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
  }

  static Future<Map<String, dynamic>> get({required String endPoint}) async {
    try {
      var response = await dio.get(
        endPoint,
        options: Options(headers: await _headers()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {'success': true, 'data': response.data};
      } else {
        return {
          'success': false,
          'error': response.data['message'] ?? 'حدث خطأ في الخادم',
          'statusCode': response.statusCode,
        };
      }
    } on DioException catch (e) {
      return {
        'success': false,
        'error':
            e.response?.data['message'] ?? e.message ?? 'فشل الاتصال بالخادم',
        'statusCode': e.response?.statusCode,
      };
    } catch (e) {
      return {'success': false, 'error': 'حدث خطأ غير متوقع: ${e.toString()}'};
    }
  }

  static Future<Map<String, dynamic>> post({
    required String endPoint,
    dynamic data,
  }) async {
    try {
      var response = await dio.post(
        endPoint,
        data: data,
        options: Options(headers: await _headers()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {'success': true, 'data': response.data};
      } else {
        return {
          'success': false,
          'error': response.data['message'] ?? 'حدث خطأ في الخادم',
          'statusCode': response.statusCode,
        };
      }
    } on DioException catch (e) {
      return {
        'success': false,
        'error':
            e.response?.data['message'] ?? e.message ?? 'فشل الاتصال بالخادم',
        'statusCode': e.response?.statusCode,
      };
    } catch (e) {
      return {'success': false, 'error': 'حدث خطأ غير متوقع: ${e.toString()}'};
    }
  }
}
