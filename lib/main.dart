import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'config/theme/app_theme.dart';
import 'presentation/pages/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vinod Sain — Mobile App Developer',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
