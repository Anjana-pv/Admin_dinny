import 'package:admin_dinny/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  
  @override
  Widget build(BuildContext context) {
    ProfileController profile = Get.put(ProfileController());

    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Obx(() => StreamBuilder(
        stream: profile.profileStream.value,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
              child: Center(
                child: Text("No Intenet"),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("Error:${snapshot.error}");
          } else if (snapshot.hasData) {
            final admindata = snapshot.data!.data() ;
           
            usernameController.text = admindata?['username']??'';
            passwordController.text = admindata?['password']??'';
            
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Profile',
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 19, 63, 20),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: 'User Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
