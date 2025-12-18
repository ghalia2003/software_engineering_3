import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_12/core/errors/failures.dart';
import 'package:flutter_application_12/core/utils/api.dart';
import 'package:flutter_application_12/features/ticket/repo/repo_ticker.dart';
import 'package:flutter_application_12/features/ticket/strategy/ticket_submit_strategy.dart.dart';

//Context
//(الكلاس اللي يستخدم الاستراتيجية)
class SupportTicketRepoImpl implements SupportTicketRepo {
  final TicketSubmitStrategy strategy;

  SupportTicketRepoImpl({required this.strategy});

  @override
  Future<Either<Failures, Map<String, dynamic>>> createTicket({
    required String subject,
    required String description,
  }) async {
    try {
      final data = strategy.buildData(subject: subject, description: description);

      final res = await ApiService.post(
        endPoint: 'support-tickets',
        data: data,
      );
print('📥 Server response: $res');
      if (res['success'] == true) {
     
        final dynamic serverData = res['data'];

        if (serverData is Map<String, dynamic>) {
          return right(serverData);
        } 
            return right({'message': serverData?.toString() ?? 'تم بنجاح'});
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
