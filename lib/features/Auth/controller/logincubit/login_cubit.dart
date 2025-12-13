import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_12/features/Auth/repo/AuthRepo.dart';



part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;

  Future<void> fetchdatalogin({
    required String password,
    required String email,
  }) async {
    emit(loginLoading());

    final response = await authRepo.fetchdatalogin(
      password: password,
      Email: email,
    );

    response.fold(
      (failure) {
        print('❌ OTP Failure: ${failure.errorMessage}');
        emit(loginFailure(failure.errorMessage));
      },
      (data) {
        print('✅ Success: $data');
        final message = data['message'] as String? ?? '';
        emit(loginSuccess(message: message));
      },
    );
  }
}
