// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAqUIGfrg38qAEaHDpUHVbxguJyPfTHBmw',
    appId: '1:591017247579:web:a383defbcbfc00691a907e',
    messagingSenderId: '591017247579',
    projectId: 'chatapp-firebase-4317a',
    authDomain: 'chatapp-firebase-4317a.firebaseapp.com',
    storageBucket: 'chatapp-firebase-4317a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAwF0IhXsO7YFj_xSoHxBAlfx7xPEJ78fw',
    appId: '1:591017247579:android:9dadec816538b6871a907e',
    messagingSenderId: '591017247579',
    projectId: 'chatapp-firebase-4317a',
    storageBucket: 'chatapp-firebase-4317a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDnLOB26hdFA_NN3V_LJDTUqa6DqJ4MSgU',
    appId: '1:591017247579:ios:65a5bf861dcaf1701a907e',
    messagingSenderId: '591017247579',
    projectId: 'chatapp-firebase-4317a',
    storageBucket: 'chatapp-firebase-4317a.appspot.com',
    iosBundleId: 'com.example.chatappFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDnLOB26hdFA_NN3V_LJDTUqa6DqJ4MSgU',
    appId: '1:591017247579:ios:a21546cb596297381a907e',
    messagingSenderId: '591017247579',
    projectId: 'chatapp-firebase-4317a',
    storageBucket: 'chatapp-firebase-4317a.appspot.com',
    iosBundleId: 'com.example.chatappFirebase.RunnerTests',
  );
}
