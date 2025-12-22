import 'package:flutter/material.dart';
import '../model/recommendation_model.dart';
import 'recommendation_strategy.dart';

class SavingsRecommendationStrategy implements RecommendationStrategy {
  @override
  bool canHandle(RecommendationModel rec) =>
      rec.message.contains('توفير') || rec.message.contains('ادخار');

  @override
  String title(RecommendationModel rec) => 'Recommendation: Savings Account';

  @override
  IconData icon(RecommendationModel rec) => Icons.savings;
}
