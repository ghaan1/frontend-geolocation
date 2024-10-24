import 'package:flutter/material.dart';
import 'package:frontend_geolocation/core/widget/button.dart';

class ImageSourcePopup extends StatelessWidget {
  final Function onGallerySelected;
  final Function onCameraSelected;

  const ImageSourcePopup({
    super.key,
    required this.onGallerySelected,
    required this.onCameraSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'Pilih Asal Foto',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Button(
              onPressed: onGallerySelected as void Function(),
              label: 'Gallery'),
          const SizedBox(height: 12),
          Button(
              onPressed: onCameraSelected as void Function(), label: 'Camera')
        ],
      ),
    );
  }
}
