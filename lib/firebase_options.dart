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
    apiKey: 'AIzaSyD6QVLJCEbiBkEkSbGitfOjoFYvr8qyI7U',
    appId: '1:193439957277:web:4b7989470b1073889fe1f4',
    messagingSenderId: '193439957277',
    projectId: 'app-shop-bf8fd',
    authDomain: 'app-shop-bf8fd.firebaseapp.com',
    storageBucket: 'app-shop-bf8fd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBVX6VbOHW70KYnwXJtWQ8ky88-aaTDgZE',
    appId: '1:193439957277:android:a952dc606361d6a29fe1f4',
    messagingSenderId: '193439957277',
    projectId: 'app-shop-bf8fd',
    storageBucket: 'app-shop-bf8fd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-FFu9356Vz11mkoLnUMUlfL5twHZh_P4',
    appId: '1:193439957277:ios:f806cae77ae1d1fd9fe1f4',
    messagingSenderId: '193439957277',
    projectId: 'app-shop-bf8fd',
    storageBucket: 'app-shop-bf8fd.appspot.com',
    iosBundleId: 'com.example.newShope',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB-FFu9356Vz11mkoLnUMUlfL5twHZh_P4',
    appId: '1:193439957277:ios:f806cae77ae1d1fd9fe1f4',
    messagingSenderId: '193439957277',
    projectId: 'app-shop-bf8fd',
    storageBucket: 'app-shop-bf8fd.appspot.com',
    iosBundleId: 'com.example.newShope',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD6QVLJCEbiBkEkSbGitfOjoFYvr8qyI7U',
    appId: '1:193439957277:web:52a3dd89af8aa48d9fe1f4',
    messagingSenderId: '193439957277',
    projectId: 'app-shop-bf8fd',
    authDomain: 'app-shop-bf8fd.firebaseapp.com',
    storageBucket: 'app-shop-bf8fd.appspot.com',
  );
}
