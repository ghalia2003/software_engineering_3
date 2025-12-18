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
   
      return right(Map<String, dynamic>.from(res['data'] ?? {}));
    } else {
   
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
      final formData = FormData.fromMap({
'OtpCode': code, 
'Email': Email
});
      final res = await ApiService.post(
        endPoint: 'Auth/verify-otp',
        data: formData,
      );
print('📥 Server response: $res');
 if (res['success'] == true) {
      return right(Map<String, dynamic>.from(res['data'] ?? {}));
    } 
    else {
   
      return left(ServerFaliure(
        errorMessage: res['error']?.toString() ?? 'حدث خطأ',
      ));
    }}
    on DioException catch (e) {
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
            final formData = FormData.fromMap({
'Password': password, 
'Email': Email
});
    
      final res = await ApiService.post(
        endPoint: 'Auth/login',
        data:formData,
      );
  print('📥 Server response: $res');
    if (res['success'] == true) {
      final data = Map<String, dynamic>.from(res['data'] ?? {});

      final sp = await SharedPreferences.getInstance();
      final token = data['token'];
      final role = data['role'];

      if (token != null) await sp.setString('token', token.toString());
      if (role != null) await sp.setString('role', role.toString());

      return right(data); 
    } 
    else {
      return left(ServerFaliure(
        errorMessage: res['error']?.toString() ?? 'حدث خطأ',
      ));
    }
  } on DioException catch (e) {
    print("⚠️ status=${e.response?.statusCode}, dataType=${e.response?.data.runtimeType}, data=${e.response?.data}");

    return left(ServerFaliure.fromDioException(e));
  } catch (e) {
    return left(ServerFaliure(errorMessage: e.toString()));
  }
}
}