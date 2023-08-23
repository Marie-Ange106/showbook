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
    apiKey: 'AIzaSyC_VZlM8HLWGiEBVuLg-_r11BK8HItvZ8M',
    appId: '1:281656413390:web:4a98c6950a46f04b18549f',
    messagingSenderId: '281656413390',
    projectId: 'showbook-bdf0a',
    authDomain: 'showbook-bdf0a.firebaseapp.com',
    storageBucket: 'showbook-bdf0a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDGXftGro6W3B5QlyTdkRWG3fG0kG0xQEk',
    appId: '1:281656413390:android:099c767f5ddb8e3518549f',
    messagingSenderId: '281656413390',
    projectId: 'showbook-bdf0a',
    storageBucket: 'showbook-bdf0a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBuxqY-BTnqyvbJ4DNQxgUErtdq1wtyHDE',
    appId: '1:281656413390:ios:872c9e9ffe2a9ba618549f',
    messagingSenderId: '281656413390',
    projectId: 'showbook-bdf0a',
    storageBucket: 'showbook-bdf0a.appspot.com',
    iosClientId: '281656413390-vdkbtqnp50jg9svl6dd0dgsidc4veb63.apps.googleusercontent.com',
    iosBundleId: 'com.example.showbook',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBuxqY-BTnqyvbJ4DNQxgUErtdq1wtyHDE',
    appId: '1:281656413390:ios:0216afe9229ac93618549f',
    messagingSenderId: '281656413390',
    projectId: 'showbook-bdf0a',
    storageBucket: 'showbook-bdf0a.appspot.com',
    iosClientId: '281656413390-usdoqc25h0eksbu5v7r5i7cpibat6me1.apps.googleusercontent.com',
    iosBundleId: 'com.example.showbook.RunnerTests',
  );
}