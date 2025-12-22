import 'package:flutter_application_12/features/Customer_sub_account/model/sub_account_leaf.dart';

import 'account_component.dart';


class MainAccountNode extends  AccountComponent {
  final int accountId;
  final String accountName;
  final double balanceValue;
  final List<SubAccountLeaf> subAccounts;

  MainAccountNode({
    required this.accountId,
    required this.accountName,
    required this.subAccounts,
    required this.balanceValue,
  });

  factory MainAccountNode.fromJson(Map<String, dynamic> json) {
    
    final subs = (json['subAccounts'] as List? ?? [])
        .map((e) => SubAccountLeaf.fromJson(Map<String, dynamic>.from(e)))
        .toList();

    return MainAccountNode(
      accountId: json['accountId'] ?? 0,
      accountName: (json['accountName'] ?? '').toString(),
       balanceValue: (json['balance'] ?? 0).toDouble(), 
      subAccounts: subs,
    );
    
  }

  @override
  String get title => "$accountName (#$accountId)";

  @override
  String get statusName => "رئيسي"; // parent status not provided in API

@override
double? get balance => balanceValue;


  @override
  DateTime? get createdAt => null;

  @override
  List<AccountComponent> get children => subAccounts;

  
}
