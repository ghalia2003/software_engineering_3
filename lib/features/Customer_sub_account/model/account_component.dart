abstract class AccountComponent {
  String get title;
  String get statusName;
  double? get balance;
  DateTime? get createdAt;
  List<AccountComponent> get children;

  bool get isLeaf => children.isEmpty;
}

