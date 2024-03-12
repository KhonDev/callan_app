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
    apiKey: 'AIzaSyBsoOH3OP0Ce_rpTsxr-LebygWL1X2daOI',
    appId: '1:556086166756:web:14f4da83c87b758bdd18f1',
    messagingSenderId: '556086166756',
    projectId: 'testforfirebaseflutter',
    authDomain: 'testforfirebaseflutter.firebaseapp.com',
    storageBucket: 'testforfirebaseflutter.appspot.com',
    measurementId: 'G-VPSTKZZ9BS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3OQQkdsEKBn7bdVlOWJS3xFiFs5X2HB0',
    appId: '1:556086166756:android:9284487f8b4e84ebdd18f1',
    messagingSenderId: '556086166756',
    projectId: 'testforfirebaseflutter',
    storageBucket: 'testforfirebaseflutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTjOK7cgdgQTaLWDkQxlThoz7vMI4qWTI',
    appId: '1:556086166756:ios:91fb27198d00beaedd18f1',
    messagingSenderId: '556086166756',
    projectId: 'testforfirebaseflutter',
    storageBucket: 'testforfirebaseflutter.appspot.com',
    iosBundleId: 'com.example.testforfirebaseflutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBTjOK7cgdgQTaLWDkQxlThoz7vMI4qWTI',
    appId: '1:556086166756:ios:6f35fb1368e97cd7dd18f1',
    messagingSenderId: '556086166756',
    projectId: 'testforfirebaseflutter',
    storageBucket: 'testforfirebaseflutter.appspot.com',
    iosBundleId: 'com.example.testforfirebaseflutter.RunnerTests',
  );
}
