import 'package:flutter/material.dart';
import 'package:practica_ef_partysoul/services/db_helper.dart';
import 'package:practica_ef_partysoul/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DbHelper dbHelper = DbHelper();
  @override
  void initState() {
    DbHelper.dbHelper.openDb();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PARTY SOUL",
      home: HomeScreen(),
    );
  }
}
