import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class NextPageScreen extends StatelessWidget {
  final XFile? image;
  final String recognizedText;
  final double? latitude;
  final double? longitude;

  const NextPageScreen({
    Key? key,
    required this.image,
    required this.recognizedText,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hasil Scan')),
      body: Column(
        children: [
          if (image != null)
            Expanded(
              flex: 3,
              child: Image.file(
                File(image!.path),
                fit: BoxFit.cover,
              ),
            ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Teks yang dikenali: $recognizedText'),
                  Text(
                      'Latitude: ${latitude ?? 'N/A'}, Longitude: ${longitude ?? 'N/A'}'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
