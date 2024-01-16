import 'package:admin_dinny/controller/auth/auth.dart';
import 'package:admin_dinny/controller/repositery/firebase_fuctions.dart';
import 'package:admin_dinny/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AdminController adminController = AdminController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: 300,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assest/images/logoimag.png'))),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Welcome to OurDinny',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: TextFormField(
                      controller: adminController.username,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: 'User Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter Username' : null,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: TextFormField(
                      controller: adminController.password,
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: 'Password',
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter Password' : null,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        bool isAuthenticated = await authenticateUser(
                          adminController.username.text,
                          adminController.password.text,
                        );

                        if (isAuthenticated) {
                          Get.to(ScreenHome());
                        } else {
                          Get.snackbar(
                            'Authentication Failed',
                            'Username or password is incorrect',
                            snackPosition: SnackPosition.BOTTOM,
                            colorText: Colors.white,
                            backgroundColor: Colors.red
                          );
                        }
                      }
                    
                      
                    },
                   style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                         const Color.fromARGB(255, 32, 101, 68), 
    
                  ),
                   ),
                    child: const Text('LOGIN',style: TextStyle(color: Colors.white),)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
