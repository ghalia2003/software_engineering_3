import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_12/core/errors/failures.dart';
import 'package:flutter_application_12/core/utils/api.dart';
import 'package:dio/dio.dart' show FormData;

import 'transfer_repo.dart';

class TransferRepoImpl implements TransferRepo {
  @override
  Future<Either<Failures, Map<String, dynamic>>> transfer({
    required int fromAccountNumber,
    required int toAccountNumber,
    required double amount,
  }) async {
    try {
      final form = FormData.fromMap({
        'FromAccountNumber': fromAccountNumber,
        'ToAccountNumber': toAccountNumber,
        'Amount': amount,
      });

      final res = await ApiService.post(
        endPoint: 'transactions/transfer',
        data: form,
      );

      if (res['success'] == true) {
        final data = res['data'];

        if (data is Map<String, dynamic>) return right(data);
        return right({'message': 'تم التحويل بنجاح'});
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
}
