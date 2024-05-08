import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localdataloginandhome/contstant/const.dart';
import 'package:localdataloginandhome/contstant/controller/login_controller.dart';
import 'package:localdataloginandhome/view/widgets/login_wid.dart';
import 'package:localdataloginandhome/view/widgets/signup_wid.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    final ac = Get.find<AuthCtrl>();
    ac.getUserDatas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteClr,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<AuthCtrl>(
            builder: (lCtrl) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          lCtrl.isLogin == false ? 'LOGIN' : 'SINGUP',
                          style:
                              kTextStyle(fontWeight: FontWeight.bold, size: 26),
                        ),
                      ),
                    ),
                    lCtrl.isLogin == false
                        ? const SizedBox(height: 180)
                        : const SizedBox(height: 50),
                    lCtrl.isLogin == false
                        ? const LoginWidget()
                        : const SignUpWid(),
                    GestureDetector(
                      onTap: () {
                        lCtrl.isLoginState();
                        lCtrl.clearCtrl();
                      },
                      child: RichText(
                        text: TextSpan(
                          text: lCtrl.isLogin == false
                              ? "Don't have An Account ?"
                              : 'have An Account ?',
                          style: TextStyle(color: greyClr),
                          children: [
                            TextSpan(
                              text:
                                  lCtrl.isLogin == false ? 'Sign Up' : 'Login',
                              style: TextStyle(
                                  color: blackClr, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
