// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCq1QORT7AILTUmE0O00o2UuOrwNEKn7BA',
    appId: '1:55602554688:web:be960ff231dd2c0358bca5',
    messagingSenderId: '55602554688',
    projectId: 'recipe-app-75677',
    authDomain: 'recipe-app-75677.firebaseapp.com',
    storageBucket: 'recipe-app-75677.appspot.com',
    measurementId: 'G-DFFDX4ZD0P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD2lQulmPqizti-rYMqecLIpIpZpUeQdxg',
    appId: '1:55602554688:android:031a54f79adaf31058bca5',
    messagingSenderId: '55602554688',
    projectId: 'recipe-app-75677',
    storageBucket: 'recipe-app-75677.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC_ZCyekK_lL8135D7k9TxPeeilKfOdg5A',
    appId: '1:55602554688:ios:82983dfe4f50763f58bca5',
    messagingSenderId: '55602554688',
    projectId: 'recipe-app-75677',
    storageBucket: 'recipe-app-75677.appspot.com',
    iosBundleId: 'com.example.recipeApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC_ZCyekK_lL8135D7k9TxPeeilKfOdg5A',
    appId: '1:55602554688:ios:82983dfe4f50763f58bca5',
    messagingSenderId: '55602554688',
    projectId: 'recipe-app-75677',
    storageBucket: 'recipe-app-75677.appspot.com',
    iosBundleId: 'com.example.recipeApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCq1QORT7AILTUmE0O00o2UuOrwNEKn7BA',
    appId: '1:55602554688:web:4983d2cc26863cf158bca5',
    messagingSenderId: '55602554688',
    projectId: 'recipe-app-75677',
    authDomain: 'recipe-app-75677.firebaseapp.com',
    storageBucket: 'recipe-app-75677.appspot.com',
    measurementId: 'G-GN3Q0FWLFS',
  );
}
