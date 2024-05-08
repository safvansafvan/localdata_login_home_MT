import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localdataloginandhome/contstant/const.dart';
import 'package:localdataloginandhome/view/auth/login.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    _handleNextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackClr,
      body: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Lottie.asset('assets/sp_loading.json'),
        ),
      ),
    );
  }

  Future<void> _handleNextScreen() async {
    await Future.delayed(const Duration(seconds: 2)).then(
      (value) async => await Get.to(
        () => const LoginView(),
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 200),
        transition: Transition.zoom,
      ),
    );
  }
}
