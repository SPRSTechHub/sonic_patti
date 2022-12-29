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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBG-nDNo2MpYBSEUNUdsBmyjqLGUv2vNqI',
    appId: '1:727450063419:web:4421cfa19a475acd9ac21e',
    messagingSenderId: '727450063419',
    projectId: 'sonic-patti',
    authDomain: 'sonic-patti.firebaseapp.com',
    storageBucket: 'sonic-patti.appspot.com',
    measurementId: 'G-WB4261026T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmanR2Oeg8l5hSQnwHYl8i0_Y0auuHpQk',
    appId: '1:727450063419:android:855c37c67c29cd659ac21e',
    messagingSenderId: '727450063419',
    projectId: 'sonic-patti',
    storageBucket: 'sonic-patti.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAx-_4FUWmkty8lytYvZXOPZKncorGxuBU',
    appId: '1:727450063419:ios:144653b68aa4b3e49ac21e',
    messagingSenderId: '727450063419',
    projectId: 'sonic-patti',
    storageBucket: 'sonic-patti.appspot.com',
    iosClientId: '727450063419-fe32ubhcjn4aa1nr2sr1ckj3dfklibbq.apps.googleusercontent.com',
    iosBundleId: 'com.example.sonicPatti',
  );
}
