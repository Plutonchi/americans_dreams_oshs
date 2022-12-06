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
    apiKey: 'AIzaSyDEup0PCCTsgcSuylfSMkgzjARoJK9U7mU',
    appId: '1:249092633208:web:ac8d5269d2ea062e0a338d',
    messagingSenderId: '249092633208',
    projectId: 'americantest-a2b9a',
    authDomain: 'americantest-a2b9a.firebaseapp.com',
    databaseURL: 'https://americantest-a2b9a-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'americantest-a2b9a.appspot.com',
    measurementId: 'G-40CE2HG652',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBQTsCYBneDakzitrUjGq9jgfLZCKdgvl4',
    appId: '1:249092633208:android:d5f03c6389a2f6e90a338d',
    messagingSenderId: '249092633208',
    projectId: 'americantest-a2b9a',
    databaseURL: 'https://americantest-a2b9a-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'americantest-a2b9a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC9jhBMh6sIYXawmxVRzpQbAVEusoQf-y4',
    appId: '1:249092633208:ios:fca4117119278ea50a338d',
    messagingSenderId: '249092633208',
    projectId: 'americantest-a2b9a',
    databaseURL: 'https://americantest-a2b9a-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'americantest-a2b9a.appspot.com',
    iosClientId: '249092633208-40buacfenjlibs6ibmvptm1icpj8clcr.apps.googleusercontent.com',
    iosBundleId: 'com.example.americanDreamOsh',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC9jhBMh6sIYXawmxVRzpQbAVEusoQf-y4',
    appId: '1:249092633208:ios:fca4117119278ea50a338d',
    messagingSenderId: '249092633208',
    projectId: 'americantest-a2b9a',
    databaseURL: 'https://americantest-a2b9a-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'americantest-a2b9a.appspot.com',
    iosClientId: '249092633208-40buacfenjlibs6ibmvptm1icpj8clcr.apps.googleusercontent.com',
    iosBundleId: 'com.example.americanDreamOsh',
  );
}
