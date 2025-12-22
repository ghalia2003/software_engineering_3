import 'package:flutter/material.dart';
import '../model/recommendation_model.dart';

abstract class RecommendationStrategy {
  bool canHandle(RecommendationModel rec);
  String title(RecommendationModel rec);
  IconData icon(RecommendationModel rec);
}
