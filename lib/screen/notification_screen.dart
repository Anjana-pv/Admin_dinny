import 'package:admin_dinny/flutter_fuction/firebase_fuctions.dart';
import 'package:admin_dinny/screen/approval_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sampleController = Get.put(UserController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 50, 73, 51),
        title: const Text("Notification", style: TextStyle(color: Colors.white)),
      ),
      body: StreamBuilder(
        stream: sampleController.getDatas(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                    Timestamp? timestamp = data['timestamp'] as Timestamp?;
                    return
                     GestureDetector(
                      onTap: (){
                        Get.to( ApprovalScreen());
                      },
                       child: Card(
                        
                        elevation: 4.0,
                        margin: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 450,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 204, 220, 205),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(data['profileImage'] ?? ''),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 28.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      capitalize(data['restaurantName'] ?? ''),
                                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 8.0),
                                    // Text(
                                   
                                      // style: TextStyle(fontSize: 14.0, color: Colors.grey),
                                    // ),
                                     if (timestamp != null)
                                      Text(
                                        "Time: ${timestamp.toDate().toString()}",
                                        style: TextStyle(fontSize: 14.0, color: Colors.grey),
                                      ),
                                    if (timestamp == null)
                                      Text(
                                        "Time: N/A",
                                        style: TextStyle(fontSize: 14.0, color: Colors.grey),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                                           ),
                     );
                  }).toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  String capitalize(String input) {
    if (input == null || input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }

//  String formatTime(Timestamp? timestamp) {
//   // if (timestamp == null) {
//   //   return "Time: N/A"; // Handle the case where timestamp is null
//   // }
//   return "Time: ${timestamp?.toDate().toString()}";
// }

}
