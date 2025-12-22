import 'package:equatable/equatable.dart';
import '../../model/recommendation_model.dart';

abstract class RecommendationsState extends Equatable {
  const RecommendationsState();
  @override
  List<Object?> get props => [];
}

class RecommendationsInitial extends RecommendationsState {}
class RecommendationsLoading extends RecommendationsState {}
class RecommendationsGenerating extends RecommendationsState {}

class RecommendationsFailure extends RecommendationsState {
  final String error;
  const RecommendationsFailure(this.error);
  @override
  List<Object?> get props => [error];
}

class RecommendationsSuccess extends RecommendationsState {
  final List<RecommendationModel> items;
  const RecommendationsSuccess(this.items);
  @override
  List<Object?> get props => [items];
}

class RecommendationsGenerateDone extends RecommendationsState {
  final String message;
  const RecommendationsGenerateDone(this.message);
  @override
  List<Object?> get props => [message];
}
