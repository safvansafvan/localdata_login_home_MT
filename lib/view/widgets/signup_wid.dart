import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localdataloginandhome/contstant/const.dart';
import 'package:localdataloginandhome/contstant/controller/login_controller.dart';
import 'package:localdataloginandhome/view/widgets/drop_down.dart';
import 'package:localdataloginandhome/view/widgets/login_form.dart';

class SignUpWid extends StatelessWidget {
  const SignUpWid({super.key});

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
                  label: 'Name',
                  prefixIcon: Icons.person,
                  controller: lCtrl.nameCtrl,
                  inputType: TextInputType.name,
                  isname: true,
                ),
                LoginFrom(
                  label: 'Email',
                  prefixIcon: Icons.email,
                  controller: lCtrl.emailCtrl,
                  inputType: TextInputType.emailAddress,
                  isUsername: true,
                ),
                LoginFrom(
                  label: 'Number',
                  prefixIcon: Icons.phone,
                  controller: lCtrl.phoneCtrl,
                  inputType: TextInputType.number,
                  isnumber: true,
                ),
                LoginFrom(
                  label: 'Password',
                  prefixIcon: Icons.key,
                  controller: lCtrl.passwordCtrl,
                  inputType: TextInputType.name,
                  isPassword: true,
                ),
                LoginFrom(
                  label: 'Conform Password',
                  prefixIcon: Icons.key,
                  controller: lCtrl.conformpasswordCtrl,
                  inputType: TextInputType.name,
                  isconformPassword: true,
                ),
                const CommonDropDown(
                  hintText: 'Select Profession',
                  list: [
                    'Doctor',
                    'Commandor',
                    'Police',
                    'Software Developer',
                    'Mechanic'
                  ],
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
                          await lCtrl.saveUserDatas();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'SIGNUP',
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
