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
    apiKey: 'AIzaSyDTpt0pm9lMExlJ5PCMqJpaXHI-_zcqE-I',
    appId: '1:1080218648496:web:9a9de98d2b03faaf80a075',
    messagingSenderId: '1080218648496',
    projectId: 'arremesso-ad1e1',
    authDomain: 'arremesso-ad1e1.firebaseapp.com',
    storageBucket: 'arremesso-ad1e1.appspot.com',
    measurementId: 'G-0JL9SN2C29',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBfdrt03tYJwDNrbUKjcJd8LAnhN5GNwpA',
    appId: '1:1080218648496:android:86c6732b9dda72c680a075',
    messagingSenderId: '1080218648496',
    projectId: 'arremesso-ad1e1',
    storageBucket: 'arremesso-ad1e1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCEf6GH6VELZHnkXv0Yc3ps1hX7RoF8EnQ',
    appId: '1:1080218648496:ios:8b6f59491a7f694d80a075',
    messagingSenderId: '1080218648496',
    projectId: 'arremesso-ad1e1',
    storageBucket: 'arremesso-ad1e1.appspot.com',
    iosClientId:
        '1080218648496-h76sb7s43fqjaj54vl1hodih98v34ri6.apps.googleusercontent.com',
    iosBundleId: 'com.agridecode.arremesso',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCEf6GH6VELZHnkXv0Yc3ps1hX7RoF8EnQ',
    appId: '1:1080218648496:ios:8b6f59491a7f694d80a075',
    messagingSenderId: '1080218648496',
    projectId: 'arremesso-ad1e1',
    storageBucket: 'arremesso-ad1e1.appspot.com',
    iosClientId:
        '1080218648496-h76sb7s43fqjaj54vl1hodih98v34ri6.apps.googleusercontent.com',
    iosBundleId: 'com.agridecode.arremesso',
  );
}
