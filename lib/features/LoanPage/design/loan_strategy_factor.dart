import 'package:flutter_application_12/features/LoanPage/design/loan_strategy.dart';
import 'package:flutter_application_12/features/LoanPage/view/loan_form_page.dart';

import 'main_account_loan_strategy.dart';
import 'sub_account_loan_strategy.dart';

class LoanStrategyFactory {
  static LoanStrategy create(LoanAccountType type) {
    switch (type) {
      case LoanAccountType.main:
        return MainAccountLoanStrategy();
      case LoanAccountType.sub:
        return SubAccountLoanStrategy();
    }
  }
}