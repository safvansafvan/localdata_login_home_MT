import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localdataloginandhome/view/home/home.dart';
import 'package:localdataloginandhome/view/widgets/toast.dart';

class AuthCtrl extends GetxController {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController conformpasswordCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();

  bool isOb = false;
  bool isLogin = false;
  String? dropDownSelected;

  String email = 's@gmail.com';
  String password = '12345678';

  void updateIsLoginOb() {
    isOb = !isOb;
    update();
  }

  void isLoginState() {
    isLogin = !isLogin;
    update();
  }

  void clearCtrl() {
    emailCtrl.clear();
    passwordCtrl.clear();
    conformpasswordCtrl.clear();
    phoneCtrl.clear();
    nameCtrl.clear();
    dropDownSelected = null;
    update();
  }

  void updateDropDown(String v) {
    dropDownSelected = v;
    update();
  }

  Future<void> login(context) async {
    log(emailCtrl.text);
    log(passwordCtrl.text);
    if (email == emailCtrl.text.trim() &&
        password == passwordCtrl.text.trim()) {
      await Get.offAll(() => const HomeView(),
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 200),
          transition: Transition.zoom);
    } else {
      messagePopUp('Wrong Email Or Password');
    }
  }
}
