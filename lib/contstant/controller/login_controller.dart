import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localdataloginandhome/contstant/local_storage.dart';
import 'package:localdataloginandhome/view/home/home.dart';
import 'package:localdataloginandhome/view/widgets/toast.dart';

class AuthCtrl extends GetxController {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController conformpasswordCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  String email = '';
  String password = '';
  String name = '';
  String phone = '';
  String profession = '';

  bool isOb = false;
  bool isLogin = false;
  String? dropDownSelected;

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
          duration: const Duration(milliseconds: 300),
          transition: Transition.cupertino);
    } else {
      messagePopUp('Invalid Credential');
    }
  }

  Future<void> saveUserDatas() async {
    StorageUtil().insertData('name', nameCtrl.text.trim());
    StorageUtil().insertData('email', emailCtrl.text.trim());
    StorageUtil().insertData('password', passwordCtrl.text.trim());
    StorageUtil().insertData('phone', phoneCtrl.text.trim());
    StorageUtil().insertData('profession', dropDownSelected);

    await Get.offAll(() => const HomeView(),
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 300),
        transition: Transition.cupertino);
  }

  void getUserDatas() {
    name = StorageUtil().readData('name') ?? "";
    email = StorageUtil().readData('email') ?? "";
    password = StorageUtil().readData('password') ?? '';
    phone = StorageUtil().readData('phone') ?? "";
    profession = StorageUtil().readData('profession') ?? "";
    update();
  }
}
