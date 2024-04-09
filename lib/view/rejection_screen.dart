// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// TextEditingController subject =TextEditingController();
// TextEditingController rejectionController = TextEditingController();
// class RejectionScreen extends StatelessWidget {
//  final String userEmail;
 
//     const RejectionScreen({super.key,
//      required this.userEmail,
  
//      });

//   @override
//   Widget build(BuildContext context) {
//     // AdminController rejectiontext = AdminController();
     
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Rejection Screen'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const Text(
//                 'Enter the Reason for Rejection',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 70),
//                const Padding(
//                  padding: EdgeInsets.only(right: 320),
//                     child: Text('To',
//                       style: TextStyle(
//                          fontWeight: FontWeight.bold
//                     ),
//                   ),
//                ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(   
//                   initialValue: userEmail,
//                    decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                    ),
//                 ),
//               ),
//               SizedBox(height: 10,),
//               const Padding(
//                  padding: EdgeInsets.only(right: 320),
//                     child: Text('Subject',
//                       style: TextStyle(
//                          fontWeight: FontWeight.bold
//                     ),
//                   ),
//                ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(   
//                   controller: subject,
//                    decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                    ),
//                 ),
//               ),
               
               
//               const SizedBox(height: 20,),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.9,
//                   height: 200,
//                   child: TextFormField(
//                     controller:rejectionController,
//                     maxLines: 5,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: 'Enter reason here...',
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () async {
//                 sentemail();
//                 print("happy");
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 17, 59, 19),
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                   textStyle: const TextStyle(fontSize: 18),
//                 ),
//                 child: const Text(
//                   'Submit',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   Future sentemail()async{
   
//     final url=Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
//     const serviceId="service_hm70feh";
//     const templateid="template_y8chdua";
//     const userid="XAFF8IwlA_b1lmPMr";

//     final response=await http.post(url,
//     headers: {'Content-Type':'application/json'},
//     body: json.encode({
//       "service_id":serviceId,
//       "template_id":templateid,
//       "user_id":userid,
//       "template_params":{
          
//         "subject":subject.text,
//         "messeage": rejectionController.text,
//         "client_id":userEmail,
//       }
//     })
//     );
//     return response.statusCode;
//   }
// }
  
