import 'package:equatable/equatable.dart';

abstract class CreateTicketState extends Equatable {
  const CreateTicketState();
  @override
  List<Object?> get props => [];
}

class CreateTicketInitial extends CreateTicketState {}

class CreateTicketLoading extends CreateTicketState {}

class CreateTicketSuccess extends CreateTicketState {
  final String message;
  const CreateTicketSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class CreateTicketFailure extends CreateTicketState {
  final String error;
  const CreateTicketFailure(this.error);

  @override
  List<Object?> get props => [error];
}
