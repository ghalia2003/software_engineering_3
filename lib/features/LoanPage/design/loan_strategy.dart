abstract class LoanStrategy {
  Map<String, dynamic> buildLoanData({
    required String totalAmount,
    required String monthlyInstallment,
    required String durationMonths,
    String? accountId,
    String? subAccountId,
  });
}