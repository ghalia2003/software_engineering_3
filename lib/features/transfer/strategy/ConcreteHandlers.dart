

import 'package:flutter_application_12/features/transfer/model/transfermodel.dart';
import 'package:flutter_application_12/features/transfer/strategy/TransferHandler.dart';

class AmountPositiveHandler extends BaseTransferHandler {
  @override
  String? handle(TransferRequest req) {
    if (req.amount <= 0) return 'المبلغ يجب أن يكون أكبر من صفر';
    return super.handle(req);
  }
}

class NotSameAccountHandler extends BaseTransferHandler {
  @override
  String? handle(TransferRequest req) {
    if (req.fromAccountNumber == req.toAccountNumber) {
      return 'لا يمكن التحويل لنفس الحساب';
    }
    return super.handle(req);
  }
}

class EnoughBalanceHandler extends BaseTransferHandler {
  @override
  String? handle(TransferRequest req) {
    if (req.fromBalance != null && req.amount > req.fromBalance!) {
      return 'الرصيد غير كافٍ';
    }
    return super.handle(req);
  }
}
