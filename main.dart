import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:trait_mate/firebase_options.dart';
import 'package:trait_mate/screens/splash_screen.dart';

late Size mq;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message: ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trait Mate',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 1,
            iconTheme: IconThemeData(color: Color.fromARGB(255, 26, 66, 225)),
            titleTextStyle: TextStyle(
                color: Color.fromARGB(255, 108, 53, 202),
                fontWeight: FontWeight.normal,
                fontSize: 20),
            backgroundColor: Colors.white),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 108, 53, 202)),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
