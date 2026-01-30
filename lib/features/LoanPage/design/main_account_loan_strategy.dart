import 'loan_strategy.dart';

class MainAccountLoanStrategy implements LoanStrategy {
  @override
  Map<String, dynamic> buildLoanData({
    required String totalAmount,
    required String monthlyInstallment,
    required String durationMonths,
    String? accountId,
    String? subAccountId,
  }) {
    return {
      "type": "MainAccount",
      "accountId": accountId,
      "totalAmount": totalAmount,
      "monthlyInstallment": monthlyInstallment,
      "durationMonths": durationMonths,
    };
  }
}