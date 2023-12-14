import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDmkomInp-HwZ7bddElIF-r_7UaO2Hc7JY",
            authDomain: "morning-coffee-v1-lxukwx.firebaseapp.com",
            projectId: "morning-coffee-v1-lxukwx",
            storageBucket: "morning-coffee-v1-lxukwx.appspot.com",
            messagingSenderId: "980290857613",
            appId: "1:980290857613:web:1b0415c865e85bb14d90c4"));
  } else {
    await Firebase.initializeApp();
  }
}
