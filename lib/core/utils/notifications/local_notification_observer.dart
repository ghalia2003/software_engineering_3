import 'package:flutter_application_12/core/utils/local_notification.dart';
import 'package:flutter_application_12/core/utils/notifications/notification_observer.dart.dart';
import 'app_notification.dart';


class LocalNotificationObserver implements NotificationObserver {
  @override
  void onNotification(AppNotification notification) {
    LocalNotificationService().showNotification(
      title: 'Bank Notification',
      body: notification.body,
    );
  }
}
