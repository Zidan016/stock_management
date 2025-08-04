import 'package:flutter/material.dart';
import 'package:stock_management/myApp/FrontEnd/home.dart';
import 'package:stock_management/myApp/FrontEnd/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Management',
      theme: ThemeClass.tema(),
      debugShowCheckedModeBanner: false,
      home:const Home(),
    );
  }
}
