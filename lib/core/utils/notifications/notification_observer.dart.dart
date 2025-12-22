import 'app_notification.dart';


abstract class NotificationObserver {
  void onNotification(AppNotification notification);
}
