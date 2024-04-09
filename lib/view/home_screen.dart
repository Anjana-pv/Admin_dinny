import 'package:admin_dinny/controller/repositery/firebase_fuctions.dart';
import 'package:admin_dinny/view/manubar_screeen.dart';
import 'package:admin_dinny/view/registrations.dart';
import 'package:admin_dinny/view/approval_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({
    super.key,
  });
  final AdminController userController = AdminController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 50, 73, 51),
          title: const Text(
            "Admin",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Get.to(const RegistrationScreen());
              },
              icon: const Icon(Icons.notifications_none_outlined,
                  color: Colors.white),
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assest/images/image_10-removebg.png")),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Row(
                children: [
                  Text(
                    "Existing List",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: userController.getAccepted(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error fetching data: ${snapshot.error}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }

                  final List<QueryDocumentSnapshot> documents =
                      snapshot.data!.docs;

                  if (documents.isEmpty) {
                    return const Center(
                      child: Text(
                        'Approved list is empty',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> data =
                          documents[index].data() as Map<String, dynamic>;

                      return GestureDetector(
                        onTap: () {
                          Get.to(ApprovalScreen(id: documents[index].id),
                              arguments: data);
                        },
                        child: Card(
                            elevation: 4.0,
                            margin: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 450,
                                height: 70,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 204, 220, 205),
                                ),
                                child: Row(children: [
                                  CachedNetworkImage(
                                    imageUrl: data['profileImage'] ?? '',
                                    placeholder: (context, url) => const Center(
                                      child:
                                          CircularProgressIndicator.adaptive(),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    fit: BoxFit.cover,
                                    height: 100,
                                    width: 100,
                                  ),
                                  const SizedBox(width: 20.0),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            capitalize(
                                                data['restaurantName'] ?? ''),
                                            style: const TextStyle(
                                                fontSize: 17.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(capitalize(data['type'] ?? ''),
                                              style: const TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold)),
                                          const SizedBox(height: 5),
                                          Text(capitalize(data['city'] ?? ''),
                                              style: const TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight:
                                                      FontWeight.normal))
                                        ],
                                      ),
                                    ),
                                  ),
                                ]))),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String capitalize(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }
}
