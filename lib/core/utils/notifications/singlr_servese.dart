import 'package:flutter_application_12/core/utils/notifications/notification_observer.dart.dart';
import 'package:signalr_core/signalr_core.dart';
import '../notifications/app_notification.dart';


class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  late HubConnection _hubConnection;
  bool _started = false;

  final List<NotificationObserver> _observers = [];

  void subscribe(NotificationObserver observer) {
    if (!_observers.contains(observer)) {
      _observers.add(observer);
    }
  }

  void unsubscribe(NotificationObserver observer) {
    _observers.remove(observer);
  }

  void _notifyAll(AppNotification n) {
  
    final snapshot = List<NotificationObserver>.from(_observers);
    for (final o in snapshot) {
      o.onNotification(n);
    }
  }

  Future<void> startConnection(String token) async {
    if (_started) return;

    _hubConnection = HubConnectionBuilder()
        .withUrl(
          'http://192.168.1.7:7149/notificationHub',
          HttpConnectionOptions(accessTokenFactory: () async => token),
        )
        .withAutomaticReconnect()
        .build();

    _hubConnection.onclose((error) {
      print('❌ SignalR closed: $error');
      _started = false;
    });

    _hubConnection.onreconnecting((error) {
      print('🔄 SignalR reconnecting: $error');
    });

    _hubConnection.onreconnected((connectionId) {
      print('✅ SignalR reconnected: $connectionId');
    });

    // ✅ هنا الحدث: بدل عرض notification مباشرة، ننشره للـ observers
    _hubConnection.on('ReceiveNotification', (args) {
      if (args == null || args.isEmpty) return;

      final n = AppNotification.fromSignalR(args[0]);
      print('🔔 ReceiveNotification: ${n.body}');

      _notifyAll(n); // ✅ Observer Pattern
    });

    try {
      await _hubConnection.start();
      _started = true;
      print('✅ SignalR Connected');
    } catch (e) {
      print('❌ Error starting SignalR: $e');
    }
  }
}
