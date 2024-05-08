import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localdataloginandhome/contstant/controller/base_controller.dart';
import 'package:localdataloginandhome/contstant/controller/login_controller.dart';
import 'package:localdataloginandhome/view/splash.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthCtrl());
    Get.put(BaseCtrl());
    return GetMaterialApp(
      title: 'local data login and home api',
      theme: ThemeData(
        fontFamily: GoogleFonts.roboto().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
