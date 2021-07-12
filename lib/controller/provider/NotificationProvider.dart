import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationProvider {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<String?> generateToken() async {
    return await messaging.getToken() ?? null;
  }
}
