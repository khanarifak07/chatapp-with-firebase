import 'package:chatapp_firebase/constants/constants.dart';
import 'package:chatapp_firebase/firebase_options.dart';
import 'package:chatapp_firebase/services/auth_gate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    //run the initialization for web
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constants.messagingSenderId,
            appId: Constants.apiId,
            messagingSenderId: Constants.messagingSenderId,
            projectId: Constants.projectId));
  } else {
    //run the initalization for android and ios
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: AuthGate(),
    );
  }
}
