abstract class TransferState {}

class TransferInitial extends TransferState {}
class TransferLoading extends TransferState {}
class TransferSuccess extends TransferState {
  final String message;
  TransferSuccess(this.message);
}
class TransferFailure extends TransferState {
  final String error;
  TransferFailure(this.error);
}
