import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localdataloginandhome/contstant/const.dart';
import 'package:localdataloginandhome/contstant/controller/login_controller.dart';
import 'package:localdataloginandhome/view/widgets/login_form.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final lCtrl = Get.find<AuthCtrl>();
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: AnimatedContainer(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: greyClr.withAlpha(300))),
        duration: const Duration(milliseconds: 500),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LoginFrom(
                  label: 'Email',
                  prefixIcon: Icons.email,
                  controller: lCtrl.emailCtrl,
                  inputType: TextInputType.name,
                  isUsername: true,
                ),
                LoginFrom(
                  label: 'Password',
                  prefixIcon: Icons.key,
                  controller: lCtrl.passwordCtrl,
                  inputType: TextInputType.name,
                  isPassword: true,
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text('Forgot password ?'),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blackClr,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await lCtrl.login(context);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'LOGIN',
                          style: kTextStyle(
                              fontWeight: FontWeight.w600,
                              size: 16,
                              color: whiteClr),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
