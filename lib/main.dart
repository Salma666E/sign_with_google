import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:macber/auth.dart';
import 'package:macber/home.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
        create: (_) => GoogleSignProvider(),
        child: const MaterialApp(title: 'Google Sign In', home: Home())),
  );
}
