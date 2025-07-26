class BalanceModel {
  final int balance;

  BalanceModel({required this.balance});

  factory BalanceModel.fromJson(Map<String, dynamic> json) {
    return BalanceModel(
      balance: json['balance'] ?? 0,
    );
  }
}
