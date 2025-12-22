import '../model/recommendation_model.dart';
import 'recommendation_strategy.dart';

class RecommendationStrategyContext {
  final List<RecommendationStrategy> strategies;

  RecommendationStrategyContext(this.strategies);

  RecommendationStrategy resolve(RecommendationModel rec) {
    return strategies.firstWhere((s) => s.canHandle(rec));
  }
}
