import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApprovalScreen extends StatelessWidget {
  const ApprovalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>?data = Get.arguments as Map<String, dynamic>?;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Approval"),
      ),
      body: Center(
        child: Container(
          height: 159,
          width: 329,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(data?['profileImage'] ?? ''),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
