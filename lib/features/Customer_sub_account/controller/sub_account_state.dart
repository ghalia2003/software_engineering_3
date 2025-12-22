import 'package:equatable/equatable.dart';
import '../model/account_component.dart';

abstract class SubAccountState extends Equatable {
  const SubAccountState();
  @override
  List<Object?> get props => [];
}

class SubAccountInitial extends SubAccountState {}
class SubAccountLoading extends SubAccountState {}

class SubAccountFailure extends SubAccountState {
  final String errorMessage;
  const SubAccountFailure(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}

class SubAccountSuccess extends SubAccountState {
  final List<AccountComponent> accounts;
  const SubAccountSuccess(this.accounts);
  @override
  List<Object?> get props => [accounts];
}
