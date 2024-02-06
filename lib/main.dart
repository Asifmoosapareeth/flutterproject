import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterproject/screens/home_screen.dart';
import 'package:flutterproject/screens/login_screen.dart';
import 'package:flutterproject/screens/phone_auth.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyB2D4ypLi_RTdEVs7XKBksFEVfKzm-TfeY',
      projectId: 'my-flutter-projectcli',
      appId: '1:542204481812:android:6acd2bf3bc2c2bc82a7201',
      messagingSenderId: '',
    ),);
  User? user = FirebaseAuth.instance.currentUser;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PhoneAuth()
    // user==null ?  LoginPage():
    // const HomePage(),
  ));

}
