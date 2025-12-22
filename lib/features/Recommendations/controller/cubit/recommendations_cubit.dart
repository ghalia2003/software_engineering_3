import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repo/recommendations_repo.dart';
import 'recommendations_state.dart';

class RecommendationsCubit extends Cubit<RecommendationsState> {
  final RecommendationsRepo repo;

  RecommendationsCubit(this.repo) : super(RecommendationsInitial());

  Future<void> load() async {
    emit(RecommendationsLoading());
    final result = await repo.fetchRecommendations();
    result.fold(
      (f) => emit(RecommendationsFailure(f.errorMessage)),
      (items) => emit(RecommendationsSuccess(items)),
    );
  }

  Future<void> generateThenLoad() async {
    emit(RecommendationsGenerating());

    final gen = await repo.generateRecommendations();
    await gen.fold(
      (f) async => emit(RecommendationsFailure(f.errorMessage)),
      (msg) async {
        emit(RecommendationsGenerateDone(msg));
        await load();
      },
    );
  }
}
