
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:combi/pages/cart_page.dart';
import 'package:combi/pages/shop_page.dart';
import 'package:combi/screens/on_boarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'models/shop.dart';
import 'services/auth/auth_gate.dart';
import 'services/notifications/notification_service.dart';
import 'theme/theme_provider.dart';


void main() async {
  // setup firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // setup notification background handler
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  // request notification permission
  final noti = NotificationService();
  await noti.requestPermission();
  noti.setupInteractions();

  // run app
  runApp(
    MultiProvider(
      providers: [
        // theme provider
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),

        // shop provider
        ChangeNotifierProvider(
          create: (context) => Shop(),
        ),
      ],
      child: const MyApp(),
    ),
  );
   
  
}

// NOTIFICATION BACKGROUND HANDLER
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
  print("Message data: ${message.data}");
  print("Message notification: ${message.notification?.title}");
  print("Message notification: ${message.notification?.body}");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthGate(),
        // '/': (context) => const OnBoardingScreen(),
        '/home': (context) => const AuthGate(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page':(context) => const CartPage(),
        // '/settings_page':(context) => const P()
        
      },
    );
  }
}
