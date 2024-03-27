import 'package:admin_dinny/view/registrations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool icons;
  final bool icon;
  final VoidCallback onDrawerIconPressed;
  

  const CustomAppBar({
    required this.title,
     required this.icons,
      required this.icon,
      required this.onDrawerIconPressed,
      
  });

  @override    
  Widget build(BuildContext context) {

    return AppBar(
      backgroundColor: const Color.fromARGB(255, 50, 73, 51),
      title: Text(title, style: const TextStyle(color: Colors.white)),
     leading: icon
  ?   IconButton
  (onPressed: onDrawerIconPressed,
    
     
      icon: const Icon(Icons.arrow_back,color: Colors.white,)
      
      ):const Icon(Icons.menu,color: Colors.white,),
  

     automaticallyImplyLeading: false,
     
      actions: icons
          ? [
              IconButton(
                onPressed: () {
                  Get.to( const RegistrationScreen());
                },
                icon: const Icon(Icons.notifications_none_outlined, color: Colors.white),
              ),
            ]
          : [],
    
  
       
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
