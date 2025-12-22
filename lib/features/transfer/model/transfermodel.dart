class TransferRequest {
  final int fromAccountNumber; // أو String حسب API
  final int toAccountNumber;
  final double amount;
  final double? fromBalance; // نستخدمها للتحقق قبل الإرسال

  TransferRequest({
    required this.fromAccountNumber,
    required this.toAccountNumber,
    required this.amount,
    this.fromBalance,
  });
}
