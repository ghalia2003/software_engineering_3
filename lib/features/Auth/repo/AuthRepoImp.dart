import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_12/core/errors/failures.dart';
import 'package:flutter_application_12/core/utils/api.dart';
import 'package:flutter_application_12/features/Auth/repo/AuthRepo.dart';



import 'package:shared_preferences/shared_preferences.dart';

class AuthRepoImpl implements AuthRepo {

  AuthRepoImpl();

  @override
  Future<Either<Failures, Map<String, dynamic>>> fetchdatasignup({
    required String FullName,
    required dynamic password,
 
    required String Email,
  }) async {
    try {
      final formData = FormData.fromMap({
  'Username': FullName,
  'Password': password,
  'Email': Email,
});
      final res = await ApiService.post(
        endPoint: 'Auth/register',
        data: formData
      );
      
print('📥 Server response: $res');
    if (res['success'] == true) {
      // رجعي الـ data الحقيقي من السيرفر فقط
      return right(Map<String, dynamic>.from(res['data'] ?? {}));
    } else {
      // رجعي الخطأ كـ Failure
      return left(ServerFaliure(
        errorMessage: res['error']?.toString() ?? 'حدث خطأ',
      ));
    }
    } on DioException catch (e) {
      return left(ServerFaliure.fromDioException(e));
    } catch (e) {
    return left(ServerFaliure(errorMessage: e.toString()));

    }
  }

  @override
  Future<Either<Failures, Map<String, dynamic>>> fetchdataotp({
    required String code,
    required String Email,
  }) async {
    try {
      final data = await ApiService.post(
        endPoint: 'verify-otp',
        data: {'Code': code, 'Email': Email},
      );

      return right(data);
    } on DioException catch (e) {
      return left(ServerFaliure.fromDioException(e));
    } catch (e) {
return left(ServerFaliure(errorMessage: e.toString()));

    }
  }

  @override
  Future<Either<Failures, Map<String, dynamic>>> fetchdataresendotp({
    required String Email,
  }) async {
    try {
      final data = await ApiService.post(
        endPoint: 'resend-otp',
        data: {'Email': Email},
      );

      return right(data);
    } on DioException catch (e) {
      return left(ServerFaliure.fromDioException(e));
    } catch (e) {
  return left(ServerFaliure(errorMessage: e.toString()));

    }
  }

  @override
  Future<Either<Failures, Map<String, dynamic>>> fetchdatalogin({
    required password,
    required String Email,
  }) async {
    try {
      final data = await ApiService.post(
        endPoint: 'login',
        data: {'Email': Email, 'password': password},
      );

      final sp = await SharedPreferences.getInstance();
      final token = data['token'];

      // await NotificationService().initConnection(token);
      final user = data['user'];

      if (token != null) {
        await sp.setString('token', token);


      }

      if (user != null) {
        await sp.setString('role', user['role']);
      }

      return right(data);
    } on DioException catch (e) {
      return left(ServerFaliure.fromDioException(e));
    } catch (e) {
return left(ServerFaliure(errorMessage: e.toString()));

    }
  }
}
