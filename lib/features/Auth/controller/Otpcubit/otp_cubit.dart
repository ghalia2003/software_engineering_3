import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_12/features/Auth/repo/AuthRepo.dart';



part 'otp_state.dart';

class OtpCubit extends Cubit<OtpcubitState> {
  OtpCubit(this.authRepo) : super(OtpcubitInitial());

  final AuthRepo authRepo;

  Future<void> fetchdataotp({
    required String code,
    required String email,
  }) async {
    emit(otpLoading());

    final response = await authRepo.fetchdataotp(code: code, Email: email);

    response.fold(
      (failure) {
        print('❌ OTP Failure: ${failure.errorMessage}');
        emit(otpFailure(failure.errorMessage));
      },
      (data) {
        print('✅ Success: $data');
        final message = data['message'] as String? ?? '';
        emit(otrpSuccess(message: message));
      },
    );
  }
}
