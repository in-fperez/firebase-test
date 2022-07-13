import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_testv2/firebase_options.dart';
import 'package:firebase_testv2/main.dart';
import 'package:firebase_testv2/services/firestore.dart';

class BackgroundService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  static Future _backgroundHandler(RemoteMessage message) async {
    print('background Handler ${message.messageId}');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    print('background Handler ${message.messageId}');
  }

  static Future _onOpenApp(RemoteMessage message) async {
    print('background Handler ${message.messageId}');
  }

  static Future initializeApp() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    token = await FirebaseMessaging.instance.getToken();
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onOpenApp);
    await FirestoreService().downloadImages();
    cubit.updateDownloadProcess();
  }
}
