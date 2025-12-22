import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_12/core/errors/failures.dart';
import 'package:flutter_application_12/core/utils/api.dart';
import '../model/account_component.dart';
import '../model/main_account_node.dart';
import 'sub_account_repo.dart';

class SubAccountRepoImpl implements SubAccountRepo {
  
  @override
  Future<Either<Failures, List<AccountComponent>>> fetchHierarchy() async {
    try {
      // 🔁 change endpoint to yours
      final res = await ApiService.get(endPoint: 'SubAccount/my-accounts/hierarchy');

      if (res['success'] == true) {
        final data = res['data'];

   
        final list = (data['data'] as List? ?? [])
            .map((e) => MainAccountNode.fromJson(Map<String, dynamic>.from(e)))
            .toList();

        return right(list);
      }
       else {
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
}
