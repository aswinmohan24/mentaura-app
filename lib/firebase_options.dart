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
    apiKey: 'AIzaSyDy6RjVyeEzabWX-2wVrc-xDYtj7uUkG6w',
    appId: '1:261321399158:web:2ec4889128d5517ca03857',
    messagingSenderId: '261321399158',
    projectId: 'mentaura-app',
    authDomain: 'mentaura-app.firebaseapp.com',
    storageBucket: 'mentaura-app.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBb-PPi6l84LQOqPtWHvvvzHGAqk9uHX_Q',
    appId: '1:261321399158:android:a905ec2444838b4da03857',
    messagingSenderId: '261321399158',
    projectId: 'mentaura-app',
    storageBucket: 'mentaura-app.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA05DcuEuYLiosjNBWv2_2xLTTM4b8Q87Y',
    appId: '1:261321399158:ios:789bbba1010a3604a03857',
    messagingSenderId: '261321399158',
    projectId: 'mentaura-app',
    storageBucket: 'mentaura-app.firebasestorage.app',
    androidClientId: '261321399158-q7usg8mvpbdhodrkkr41h2s2q8fvrtma.apps.googleusercontent.com',
    iosClientId: '261321399158-gtqtddl0n95iegsmp62mnuq8aa72s9j7.apps.googleusercontent.com',
    iosBundleId: 'com.example.mentauraApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA05DcuEuYLiosjNBWv2_2xLTTM4b8Q87Y',
    appId: '1:261321399158:ios:789bbba1010a3604a03857',
    messagingSenderId: '261321399158',
    projectId: 'mentaura-app',
    storageBucket: 'mentaura-app.firebasestorage.app',
    androidClientId: '261321399158-q7usg8mvpbdhodrkkr41h2s2q8fvrtma.apps.googleusercontent.com',
    iosClientId: '261321399158-gtqtddl0n95iegsmp62mnuq8aa72s9j7.apps.googleusercontent.com',
    iosBundleId: 'com.example.mentauraApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDy6RjVyeEzabWX-2wVrc-xDYtj7uUkG6w',
    appId: '1:261321399158:web:00e337e887d1e176a03857',
    messagingSenderId: '261321399158',
    projectId: 'mentaura-app',
    authDomain: 'mentaura-app.firebaseapp.com',
    storageBucket: 'mentaura-app.firebasestorage.app',
  );
}