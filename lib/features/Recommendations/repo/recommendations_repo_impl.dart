import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_12/core/errors/failures.dart';
import 'package:flutter_application_12/core/utils/api.dart';
import '../model/recommendation_model.dart';
import 'recommendations_repo.dart';

class RecommendationsRepoImpl implements RecommendationsRepo {
  @override
  Future<Either<Failures, String>> generateRecommendations() async {
    try {
      final res = await ApiService.post(endPoint: 'recommendations/generate');

      if (res['success'] == true) {
        final data = res['data']; 
        final msg = (data is Map && data['message'] != null)
            ? data['message'].toString()
            : 'تم توليد التوصيات بنجاح';
        return right(msg);
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
  Future<Either<Failures, List<RecommendationModel>>> fetchRecommendations() async {
    try {
      final res = await ApiService.get(endPoint: 'recommendations');

      if (res['success'] == true) {
        final data = res['data']; 

        final list = (data as List? ?? [])
            .map((e) => RecommendationModel.fromJson(
                  Map<String, dynamic>.from(e),
                ))
            .toList();

        return right(list);
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
