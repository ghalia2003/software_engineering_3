import 'package:dartz/dartz.dart';
import 'package:flutter_application_12/core/errors/failures.dart';
import '../model/account_component.dart';

abstract class SubAccountRepo {
  Future<Either<Failures, List<AccountComponent>>> fetchHierarchy();
}
