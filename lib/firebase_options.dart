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
    apiKey: 'AIzaSyABAZCoYzYv59QVchuUSpki6DEJTZxZhLo',
    appId: '1:154221242699:web:327dc75109397aa47160ce',
    messagingSenderId: '154221242699',
    projectId: 'exploresl-firebase',
    authDomain: 'exploresl-firebase.firebaseapp.com',
    storageBucket: 'exploresl-firebase.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDdUEGYioH8sBg2Wh_nFyJPSnwJ5-z7taE',
    appId: '1:154221242699:android:539d9dc33d8170f77160ce',
    messagingSenderId: '154221242699',
    projectId: 'exploresl-firebase',
    storageBucket: 'exploresl-firebase.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBWNoDDKRqWXFlrTI8MvPAw4B2RF70Wu90',
    appId: '1:154221242699:ios:4ed5681412a2d97a7160ce',
    messagingSenderId: '154221242699',
    projectId: 'exploresl-firebase',
    storageBucket: 'exploresl-firebase.appspot.com',
    iosBundleId: 'com.example.exploreslLogin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBWNoDDKRqWXFlrTI8MvPAw4B2RF70Wu90',
    appId: '1:154221242699:ios:4ed5681412a2d97a7160ce',
    messagingSenderId: '154221242699',
    projectId: 'exploresl-firebase',
    storageBucket: 'exploresl-firebase.appspot.com',
    iosBundleId: 'com.example.exploreslLogin',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyABAZCoYzYv59QVchuUSpki6DEJTZxZhLo',
    appId: '1:154221242699:web:0e04b012b55e504c7160ce',
    messagingSenderId: '154221242699',
    projectId: 'exploresl-firebase',
    authDomain: 'exploresl-firebase.firebaseapp.com',
    storageBucket: 'exploresl-firebase.appspot.com',
  );

}