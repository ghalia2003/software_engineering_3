class RecommendationModel {
  final int clientId;
  final String clientFullName;
  final String message;
  final DateTime createdDate;

  RecommendationModel({
    required this.clientId,
    required this.clientFullName,
    required this.message,
    required this.createdDate,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      clientId: json['clientId'] ?? 0,
      clientFullName: (json['clientFullName'] ?? '').toString(),
      message: (json['message'] ?? '').toString(),
      createdDate:
          DateTime.tryParse((json['createdDate'] ?? '').toString()) ??
              DateTime.now(),
    );
  }
}
