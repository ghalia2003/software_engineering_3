import 'package:dartz/dartz.dart';
import 'package:flutter_application_12/core/errors/failures.dart';



abstract class AuthRepo {
  Future<Either<Failures, Map<String, dynamic>>> fetchdatasignup({
    required String FullName,
    required dynamic password,
    required String Email,
  });
  Future<Either<Failures, Map<String, dynamic>>> fetchdataotp({
    required String code,
    required String Email,
  });

  Future<Either<Failures, Map<String, dynamic>>> fetchdataresendotp({
    required String Email,
  });

  Future<Either<Failures, Map<String, dynamic>>> fetchdatalogin({
    required dynamic password,
    required String Email,
  });
}
