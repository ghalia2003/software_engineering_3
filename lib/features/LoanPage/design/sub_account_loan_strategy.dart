import 'loan_strategy.dart';

class SubAccountLoanStrategy implements LoanStrategy {
  @override
  Map<String, dynamic> buildLoanData({
    required String totalAmount,
    required String monthlyInstallment,
    required String durationMonths,
    String? accountId,
    String? subAccountId,
  }) {
    return {
      "type": "SubAccount",
      "subAccountId": subAccountId,
      "totalAmount": totalAmount,
      "monthlyInstallment": monthlyInstallment,
      "durationMonths": durationMonths,
    };
  }
}