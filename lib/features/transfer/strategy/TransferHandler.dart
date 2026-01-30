

import 'package:flutter_application_12/features/transfer/model/transfermodel.dart';

abstract class TransferHandler {
  TransferHandler setNext(TransferHandler handler);
  String? handle(TransferRequest req); 
}

abstract class BaseTransferHandler implements TransferHandler {
  TransferHandler? _next;

  @override
  TransferHandler setNext(TransferHandler handler) {
    _next = handler;
    return handler;
  }

  @override
  String? handle(TransferRequest req) {
    if (_next == null) return null;
    return _next!.handle(req);
  }
}
