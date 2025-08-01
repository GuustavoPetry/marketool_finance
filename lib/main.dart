import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:marketool_financer/src/app/app_widget.dart';
import 'package:marketool_financer/src/services/notifications_service.dart'; 

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Mensagem recebida em background: ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await NotificationsService.instance.init(); 
  await NotificationsService.instance.getDeviceToken(); 

  runApp(const AppWidget());
}
