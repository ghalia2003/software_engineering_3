import 'package:flutter_application_12/features/ticket/controller/cubit/ticket_state.dart';
import 'package:flutter_application_12/features/ticket/repo/repo_ticker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CreateTicketCubit extends Cubit<CreateTicketState> {
  final SupportTicketRepo repo;

  CreateTicketCubit(this.repo) : super(CreateTicketInitial());

  Future<void> submitTicket({
    required String subject,
    required String description,
  }) async {
    emit(CreateTicketLoading());

    final result = await repo.createTicket(
      subject: subject,
      description: description,
    );

    result.fold(
            
      (failure) {
              print('❌ OTP Failure: ${failure.errorMessage}');
       emit(CreateTicketFailure(failure.errorMessage));},
      (data) {
           print('✅ Success: $data');
        // في صورتك: {"message":"تم إنشاء تذكرة الدعم بنجاح"}
        final msg = (data['message'] ?? 'تم إرسال التذكرة بنجاح').toString();
        emit(CreateTicketSuccess(msg));
      },
    );
  }
}
