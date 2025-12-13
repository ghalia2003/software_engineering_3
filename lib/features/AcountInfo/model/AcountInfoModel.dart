class AccountType {
  final String name;
  final String subtitle;
  final double interestRate;
  final double withdrawLimit;
  final double depositLimit;
  final double monthlyFee;
  final String terms;

  AccountType({
    required this.name,
    required this.subtitle,
    required this.interestRate,
    required this.withdrawLimit,
    required this.depositLimit,
    required this.monthlyFee,
    required this.terms,
  });
}
