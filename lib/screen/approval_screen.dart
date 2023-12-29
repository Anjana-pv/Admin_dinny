
import 'dart:developer';
import 'package:admin_dinny/repositery/functions_fiel.dart';
import 'package:admin_dinny/reusable_widgets/reusing_text.dart';
import 'package:admin_dinny/screen/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ApprovalScreen extends StatelessWidget {
  const ApprovalScreen({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data = Get.arguments as Map<String, dynamic>?;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 249, 247),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 50, 73, 51),
        title: const Text(
          "Approval",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  height: 159,
                  width: 329,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: NetworkImage(data?['profileImage'] ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 400,
                width: 329,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color.fromARGB(107, 171, 174, 171)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0, left: 20.0),
                      child: Text(
                        "Restaurant Details",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 30),
                    buildTextRow(
                        "Restaurant Name     :", data?['restaurantName']),
                    buildTextRow("Owner Name             :", data?['owner']),
                    buildTextRow("Type of Restaurant  :", data?['type']),
                    buildTextRow(
                        "Pincode                     :", data?['pinCode']),
                    buildTextRow("Working Hours         :",
                        data?['workingHours']?.toString()),
                    buildTextRow("Total Seats                :",
                        data?['seatCount']?.toString()),
                    buildTextRow(
                        "Address                     :", data?['address']),
                    const SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            openPdfDocument(data?['pdf']);
                          },
                          child: const Text("Documents",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
                        ),
                        GestureDetector(
                            onTap: () {
                              showMenuImages(data?['menuCards']);
                            },
                            child: const Text("Images",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Get.to(
                          () => ScreenHome(
                            profileImage: data?['profileImage'],
                            restaurantName: data?['restaurantName'],
                            resturentName: '',
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            255, 4, 163, 63), // Change the color as needed
                      ),
                      child: const Text(
                        "Accept",
                        style: TextStyle(color: Colors.white),
                      )),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Confirmation"),
                            content:
                                const Text("Are you sure you want to reject?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {
                                  log(id);
                                 deleteDataFromFirebase(id);
                                Get.back();
                                Get.to(ScreenHome(profileImage: "", restaurantName: "", resturentName: ""));
                                },
                                child: const Text("Confirm"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 239, 13, 13),
                    ),
                    child: const Text("Reject",
                        style: TextStyle(color: Colors.white)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void openPdfDocument(String? pdfUrl) async {
    if (pdfUrl != null) {
      await Get.to(
        () => Scaffold(
          appBar: AppBar(title: const Text('PDF Document')),
          body: SfPdfViewer.network(
            pdfUrl,
            canShowPaginationDialog: false,
          ),
        ),
      );
    } else {
      print('PDF URL not available');
    }
  }
 Future <void> deleteDataFromFirebase(String? documentId) async{
 try {
      
  if (documentId != null) {
   await  FirebaseFirestore.instance
          .collection('clients') 
          .doc(documentId)
          .delete();
  } else {
    print('Document ID not available');
  }
 } catch (e) {
   log('$e');
 }
}

}
