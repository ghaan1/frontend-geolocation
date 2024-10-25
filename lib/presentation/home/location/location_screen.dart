import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:frontend_geolocation/presentation/home/location/next_page_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'location_provider.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Future<void> _askPermissions(LocationProvider locationProvider) async {
    Map<Permission, PermissionStatus> statuses =
        await [Permission.camera, Permission.locationWhenInUse].request();

    if (statuses[Permission.camera]!.isGranted &&
        statuses[Permission.locationWhenInUse]!.isGranted) {
      locationProvider.initializeCamera();
    } else {
      print('Izin kamera atau lokasi tidak diberikan');
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final locationProvider =
          Provider.of<LocationProvider>(context, listen: false);
      _askPermissions(locationProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _locationProvider = Provider.of<LocationProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('OCR & Lokasi')),
      body: Column(
        children: [
          // Bagian 3/4 untuk preview kamera
          _locationProvider.cameraController == null ||
                  !_locationProvider.cameraController!.value.isInitialized
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                  flex: 3, // 3/4 bagian layar
                  child: AspectRatio(
                    aspectRatio:
                        _locationProvider.cameraController!.value.aspectRatio,
                    child: CameraPreview(_locationProvider.cameraController!),
                  ),
                ),

          // Bagian 1/4 untuk info OCR dan Lokasi
          Expanded(
            flex: 1, // 1/4 bagian layar
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Teks yang dikenali: ${_locationProvider.state.recognizedText}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Latitude: ${_locationProvider.state.latitude ?? 'N/A'}, Longitude: ${_locationProvider.state.longitude ?? 'N/A'}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _locationProvider.getLocation();
                        },
                        child: const Text('Ambil Lokasi'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _locationProvider.captureImage(); // Ambil gambar
                        },
                        child: const Text('Ambil Gambar'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Pindah ke halaman berikutnya
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NextPageScreen(
                                image: _locationProvider.capturedImage,
                                recognizedText:
                                    _locationProvider.state.recognizedText,
                                latitude: _locationProvider.state.latitude,
                                longitude: _locationProvider.state.longitude,
                              ),
                            ),
                          );
                        },
                        child: const Text('Next Page'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
