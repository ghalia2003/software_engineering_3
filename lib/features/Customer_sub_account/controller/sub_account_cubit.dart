import 'package:flutter_bloc/flutter_bloc.dart';
import '../repo/sub_account_repo.dart';
import 'sub_account_state.dart';

class SubAccountCubit extends Cubit<SubAccountState> {
  final SubAccountRepo repo;

  SubAccountCubit(this.repo) : super(SubAccountInitial());

  Future<void> loadHierarchy() async {
    emit(SubAccountLoading());

    final result = await repo.fetchHierarchy();

    result.fold(
      (failure) => emit(SubAccountFailure(failure.errorMessage)),
      (accounts) => emit(SubAccountSuccess(accounts)),
    );
  }
}
