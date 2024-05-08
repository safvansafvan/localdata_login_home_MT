import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:localdataloginandhome/view/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'local data login and home api',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
