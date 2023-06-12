import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/screen.dart';
import 'package:flutter_application_2/components/dialog.dart';
import 'package:flutter_application_2/components/screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Immanuel Lumban Toruan',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: RingtoneApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
