import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localdataloginandhome/contstant/const.dart';
import 'package:localdataloginandhome/view/auth/login.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Information',
                style: kTextStyle(fontWeight: FontWeight.w600, size: 16),
              ),
              const Divider(),
              Text(
                'Company: Geeksynergy Technologies Pvt Ltd',
                style: kTextStyle(fontWeight: FontWeight.w600, size: 14),
              ),
              const SizedBox(height: 8),
              Text(
                'Address: Sanjayanagar, Bengaluru-56',
                style: kTextStyle(fontWeight: FontWeight.w600, size: 14),
              ),
              const SizedBox(height: 8),
              Text(
                'Phone: XXXXXXXXX09',
                style: kTextStyle(fontWeight: FontWeight.w600, size: 14),
              ),
              const SizedBox(height: 8),
              Text(
                'Email: XXXXXX@gmail.com',
                style: kTextStyle(fontWeight: FontWeight.w600, size: 14),
              ),
              const Spacer(),
              ListTile(
                onTap: () {
                  Get.offAll(() => const LoginView());
                },
                title: Text(
                  'Logout',
                  style: kTextStyle(fontWeight: FontWeight.w600, size: 14),
                ),
                trailing: const Icon(Icons.logout),
              )
            ],
          ),
        ),
      ),
    );
  }
}
