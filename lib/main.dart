import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/service/db_service.dart';
import 'package:pos_app/myApp/frontEnd/binding/pages.dart';
import 'package:pos_app/myApp/frontEnd/style/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(DbService(), permanent: true);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mini Pos App',
      initialRoute: '/initial',
      theme: AppTheme.myTheme,
      getPages: Pages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
