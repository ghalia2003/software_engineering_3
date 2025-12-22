import 'package:dartz/dartz.dart';
import 'package:flutter_application_12/core/errors/failures.dart';
import '../model/recommendation_model.dart';

abstract class RecommendationsRepo {
  Future<Either<Failures, String>> generateRecommendations(); 
  Future<Either<Failures, List<RecommendationModel>>> fetchRecommendations(); 
}
