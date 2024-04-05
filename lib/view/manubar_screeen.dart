import 'package:admin_dinny/controller/auth/auth.dart';
import 'package:admin_dinny/view/privacy_polices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AuthencationController authcontroller =Get.put(AuthencationController());
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assest/images/image 8.png'),
                fit: BoxFit.cover,
              ),
            ),
            accountName: null,
            accountEmail: null,
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Admin',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          // ListTile(
          //   leading: const Icon(Icons.person),
          //   title: const Text('Profile'),
          //   onTap: () {
          //   Get.to(const ProfileScreen());
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share App'),
            onTap: () {
             Share.share('am happy');
            },
          ),
          
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Policy and Privacy'),
            onTap: () {
              Get.to(const AdminPrivacyPolicyScreen());
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.policy),
          //   title: const Text('Terms and Conditions'),
          //   onTap: () {
          //     // Handle terms and conditions tap
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log out'),
            onTap: () {
             authcontroller.logout();
            },
          ),
        ],
      ),
    );
  }

}
