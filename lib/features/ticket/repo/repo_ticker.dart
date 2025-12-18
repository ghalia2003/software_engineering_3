import 'package:dartz/dartz.dart';
import 'package:flutter_application_12/core/errors/failures.dart';

abstract class SupportTicketRepo {
  Future<Either<Failures, Map<String, dynamic>>> createTicket({
    required String subject,
    required String description,
  });
}
