import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/service/db_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(()=> DbService(), permanent: true);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Management',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pos App'),
        ),
      ),
    );
  }
}
