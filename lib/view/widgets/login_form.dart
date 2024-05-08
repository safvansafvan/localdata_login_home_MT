import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:localdataloginandhome/contstant/const.dart';
import 'package:localdataloginandhome/contstant/controller/login_controller.dart';

class LoginFrom extends StatelessWidget {
  const LoginFrom({
    super.key,
    required this.label,
    required this.controller,
    required this.prefixIcon,
    this.inputType,
    this.isUsername = false,
    this.isPassword = false,
  });

  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final bool isUsername;
  final IconData prefixIcon;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthCtrl>(builder: (loginCtrl) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
        child: Center(
          child: TextFormField(
            keyboardType: inputType,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            cursorColor: Colors.black,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            maxLengthEnforcement: MaxLengthEnforcement.none,
            decoration: InputDecoration(
              prefixIcon: Icon(prefixIcon),
              suffixIcon: isPassword
                  ? IconButton(
                      onPressed: () {
                        loginCtrl.updateIsLoginOb();
                      },
                      icon: Icon(
                        loginCtrl.isOb
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: blackClr,
                      ),
                    )
                  : null,
              errorStyle: const TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 14, color: Colors.red),
              label: Text(label),
              labelStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.grey),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.red)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.red)),
            ),
            obscureText: isPassword == true ? loginCtrl.isOb : false,
            validator: (value) {
              if (isPassword) {
                if (value == null || value.isEmpty) {
                  return 'Enter Password';
                }
                if (value.length < 7) {
                  return 'Minimum 7 Letters';
                }
              }
              if (isUsername) {
                if (value == null || value.isEmpty) {
                  return 'Enter Email';
                }
                if (!EmailValidator.validate(value)) {
                  return 'Enter Valid Email';
                }
              }

              return null;
            },
          ),
        ),
      );
    });
  }
}