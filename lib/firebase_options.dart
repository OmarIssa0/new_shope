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
    apiKey: 'AIzaSyA_B6gVY5NRpagMsujw8XdOiLvPM-Y-1zg',
    appId: '1:486369665359:web:dfdf865b3aef362651653a',
    messagingSenderId: '486369665359',
    projectId: 'newsmartshope',
    authDomain: 'newsmartshope.firebaseapp.com',
    storageBucket: 'newsmartshope.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCrkuilheB88kL20pqQe8xM3SJK5NdRBhk',
    appId: '1:486369665359:android:1cd4489fcc8ff3ae51653a',
    messagingSenderId: '486369665359',
    projectId: 'newsmartshope',
    storageBucket: 'newsmartshope.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCVmB9IBGj6Cj-d5wCCPIiSEpr0FUBUkNA',
    appId: '1:486369665359:ios:018bad6deced730451653a',
    messagingSenderId: '486369665359',
    projectId: 'newsmartshope',
    storageBucket: 'newsmartshope.appspot.com',
    androidClientId: '486369665359-guc93tsvus91bp72psauo0frc6qkef8s.apps.googleusercontent.com',
    iosClientId: '486369665359-1t0lruthrpieof9luhr742nmces99l3j.apps.googleusercontent.com',
    iosBundleId: 'com.example.newShope',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCVmB9IBGj6Cj-d5wCCPIiSEpr0FUBUkNA',
    appId: '1:486369665359:ios:fde80bb4852cf7de51653a',
    messagingSenderId: '486369665359',
    projectId: 'newsmartshope',
    storageBucket: 'newsmartshope.appspot.com',
    androidClientId: '486369665359-guc93tsvus91bp72psauo0frc6qkef8s.apps.googleusercontent.com',
    iosClientId: '486369665359-q14lnic0nd9ftuv1c9cdrvs6cs8j9qp3.apps.googleusercontent.com',
    iosBundleId: 'com.example.newShope.RunnerTests',
  );
}