import 'package:flutter/material.dart';
import '../model/recommendation_model.dart';
import 'recommendation_strategy.dart';

class DefaultRecommendationStrategy implements RecommendationStrategy {
  @override
  bool canHandle(RecommendationModel rec) => true;

  @override
  String title(RecommendationModel rec) => 'توصية';

  @override
  IconData icon(RecommendationModel rec) => Icons.lightbulb;
}
