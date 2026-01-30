part of 'loan_cubit.dart';

@immutable
sealed class LoanState {}

final class LoanInitial extends LoanState {}

final class LoanLoading extends LoanState {}

final class LoanFailure extends LoanState {
  final String errorMessage;

  LoanFailure({required this.errorMessage});
}

final class LoanSuccess extends LoanState {}