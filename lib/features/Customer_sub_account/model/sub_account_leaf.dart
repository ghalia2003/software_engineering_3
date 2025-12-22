import 'account_component.dart';

class SubAccountLeaf extends  AccountComponent {
  final int subAccountId;
  final int parentAccountId;
  final double dailyWithdrawalLimit;
  final double transferLimit;
  final String usageAreas;
  final String userPermissions;
  final double balanceValue;
  final DateTime createdAtValue;
  final String statusNameValue;

  SubAccountLeaf({
    required this.subAccountId,
    required this.parentAccountId,
    required this.dailyWithdrawalLimit,
    required this.transferLimit,
    required this.usageAreas,
    required this.userPermissions,
    required this.balanceValue,
    required this.createdAtValue,
    required this.statusNameValue,
  });

  factory SubAccountLeaf.fromJson(Map<String, dynamic> json) {
    return SubAccountLeaf(
      subAccountId: json['subAccountId'] ?? 0,
      parentAccountId: json['parentAccountId'] ?? 0,
      dailyWithdrawalLimit: (json['dailyWithdrawalLimit'] ?? 0).toDouble(),
      transferLimit: (json['transferLimit'] ?? 0).toDouble(),
      usageAreas: (json['usageAreas'] ?? '').toString(),
      userPermissions: (json['userPermissions'] ?? '').toString(),
      balanceValue: (json['balance'] ?? 0).toDouble(),
      createdAtValue: DateTime.tryParse((json['createdAt'] ?? '').toString()) ?? DateTime.now(),
      statusNameValue: (json['statusName'] ?? '').toString(),
    );
  }

  @override
  String get title => "SubAcount #$subAccountId  \n (Parent #$parentAccountId)";

  @override
  String get statusName => statusNameValue;

  @override
  double? get balance => balanceValue;

  @override
  DateTime? get createdAt => createdAtValue;

  @override
  List<AccountComponent> get children => const [];
}
