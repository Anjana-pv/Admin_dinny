import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void showMenuImages(List<dynamic>? menuImageUrls) {
    if (menuImageUrls != null && menuImageUrls.isNotEmpty) {
      Get.to(
        () => Scaffold(
          appBar: AppBar(title: const Text('Menu Images')),
          body: ListView.builder(
            itemCount: menuImageUrls.length,
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: menuImageUrls[index],
                 placeholder: (context, url) => const SizedBox.expand(
                    child: CircularProgressIndicator(),
                  ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              );
            },
          ),
        ),
      );
    } else {
      
      print('Menu image URLs not available');
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
  
  }
