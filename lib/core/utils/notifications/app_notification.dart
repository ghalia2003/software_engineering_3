class AppNotification {
  final String message;
  final String dateText;

  AppNotification({
    required this.message,
    required this.dateText,
  });

  factory AppNotification.fromSignalR(dynamic data) {
    String message = '';
    String dateText = '';

    if (data is Map) {
      message = (data['Message'] ?? data['message'] ?? '').toString();
      dateText = (data['Date'] ?? data['date'] ?? '').toString();
    } else {
      message = data.toString();
    }

    return AppNotification(message: message, dateText: dateText);
  }

  String get body =>  message;
}
