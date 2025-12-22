import 'package:dartz/dartz.dart';
import 'package:flutter_application_12/core/errors/failures.dart';

abstract class TransferRepo {
  Future<Either<Failures, Map<String, dynamic>>> transfer({
    required int fromAccountNumber,
    required int toAccountNumber,
    required double amount,
  });
}
