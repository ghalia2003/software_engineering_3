import 'package:flutter_application_12/features/transfer/model/transfermodel.dart';
import 'package:flutter_application_12/features/transfer/repo/transfer_repo.dart';
import 'package:flutter_application_12/features/transfer/strategy/ConcreteHandlers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'transfer_state.dart';


class TransferCubit extends Cubit<TransferState> {
  final TransferRepo repo;

  // ✅ Chain
  late final AmountPositiveHandler _chainStart;

  TransferCubit(this.repo) : super(TransferInitial()) {
    _chainStart = AmountPositiveHandler()
      ..setNext(NotSameAccountHandler())
      ..setNext(EnoughBalanceHandler());
  }

  Future<void> submitTransfer({
    required int fromAccountNumber,
    required int toAccountNumber,
    required double amount,
    required double? fromBalance,
  }) async {
    // ✅ validate by chain
    final req = TransferRequest(
      fromAccountNumber: fromAccountNumber,
      toAccountNumber: toAccountNumber,
      amount: amount,
      fromBalance: fromBalance,
    );

    final error = _chainStart.handle(req);
    if (error != null) {
      emit(TransferFailure(error));
      return;
    }

    emit(TransferLoading());

    final result = await repo.transfer(
      fromAccountNumber: fromAccountNumber,
      toAccountNumber: toAccountNumber,
      amount: amount,
    );

    result.fold(
      (f) => emit(TransferFailure(f.errorMessage)),
      (data) {
        final msg = (data['message'] ?? 'تم التحويل بنجاح').toString();
        emit(TransferSuccess(msg));
      },
    );
  }
}
