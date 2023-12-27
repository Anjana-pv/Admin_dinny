

import 'package:admin_dinny/flutter_fuction/firebase_fuctions.dart';
import 'package:admin_dinny/screen/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final sampleController = Get.put(UserController());
   return Scaffold(
    backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 50, 73, 51),
        title: const Text('Admin',style:TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined,color: Colors.white,),
            onPressed: () {
             Get.to(const NotificationScreen());
            },
          ),
        ],
      ),
    body: Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 300,
           width: 300,
           decoration: const BoxDecoration(
            image: DecorationImage(image:AssetImage("assest/image_10-removebg.png")),
            
           ),
           
          ),
      
        ],
      ),
    ),


      // body: StreamBuilder( 
      //     stream: sampleController.getDatas(),
      //     builder: (context, snapshot) {
          
      //       if (snapshot.hasData) {  
      //          List dataList = snapshot.data!.docs;        
      //         return ListView.builder(itemBuilder: (context,index){
      //          final  data=dataList[index];
      //          Map<String, dynamic> sinleData =
      //                 data.data() as Map<String, dynamic>;
      //           return ListTile(title: Text(sinleData['nomi'])); 
      //         },itemCount: dataList.length,);
      //       } else {
      //         return Center(
      //           child: Text('no data'),
      //         );
      //       }
      //     }),
    );
  }
}


