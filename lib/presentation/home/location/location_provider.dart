import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:geolocator/geolocator.dart';

import 'location_state.dart';

class LocationProvider extends ChangeNotifier {
  final state = LocationState();
  CameraController? _cameraController;
  bool _isDetecting = false;
  final TextRecognizer _textRecognizer = GoogleMlKit.vision.textRecognizer();

  // Variabel untuk menyimpan gambar yang diambil
  XFile? _capturedImage;

  CameraController? get cameraController => _cameraController;
  XFile? get capturedImage => _capturedImage;

  // Inisialisasi kamera
  Future<void> initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        print('No cameras available');
        return;
      }
      final camera = cameras.first;

      _cameraController = CameraController(
        camera,
        ResolutionPreset
            .max, // Menggunakan resolusi tertinggi untuk hasil terbaik
        enableAudio: false,
      );

      await _cameraController?.initialize();
      print('Camera initialized successfully');
      _startOcrDetection(); // Mulai OCR setelah kamera diinisialisasi
    } catch (e) {
      print('Error initializing camera: $e');
    }

    notifyListeners();
  }

  // Fungsi untuk mengambil gambar
  Future<void> captureImage() async {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      try {
        _capturedImage = await _cameraController!.takePicture();
        notifyListeners();
      } catch (e) {
        print('Error capturing image: $e');
      }
    }
  }

  Uint8List _convertYUV420ToNV21(CameraImage image) {
    final int width = image.width;
    final int height = image.height;
    final int size = width * height;

    // Allocate buffer for the resulting NV21 image.
    Uint8List nv21 = Uint8List(size + (size ~/ 2));

    // Copy Y plane
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        nv21[y * width + x] =
            image.planes[0].bytes[y * image.planes[0].bytesPerRow + x];
      }
    }

    // Copy UV planes (interleave V and U values)
    int uvIndex = size;
    for (int y = 0; y < height ~/ 2; y++) {
      for (int x = 0; x < width; x += 2) {
        nv21[uvIndex++] =
            image.planes[2].bytes[y * image.planes[2].bytesPerRow + x]; // V
        nv21[uvIndex++] =
            image.planes[1].bytes[y * image.planes[1].bytesPerRow + x]; // U
      }
    }

    return nv21;
  }

  // Mulai deteksi OCR dari stream kamera
  void _startOcrDetection() {
    if (_cameraController == null) return;

    _cameraController!.startImageStream((CameraImage image) async {
      if (_isDetecting) return;

      _isDetecting = true;
      try {
        print(
            'Image format: ${image.format.raw}, Image size: ${image.width}x${image.height}');

        // Konversi CameraImage menjadi InputImage
        final inputImage = _getInputImageFromCameraImage(image);

        // Proses OCR menggunakan Google ML Kit
        final RecognizedText recognizedText =
            await _textRecognizer.processImage(inputImage);

        if (recognizedText.text.isNotEmpty) {
          state.setRecognizedText(recognizedText.text);
          notifyListeners();
        }
      } catch (e) {
        print('Error during OCR processing: $e');
      } finally {
        _isDetecting = false;
      }
    });
  }

  // Mendapatkan lokasi saat ini
  Future<void> getLocation() async {
    try {
      final permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        await Geolocator.requestPermission();
      }

      final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      state.setLocation(position.latitude, position.longitude);
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print('Error during location fetching: $e');
      }
    }
  }

  // Mengubah CameraImage ke InputImage untuk Google ML Kit
  InputImage _getInputImageFromCameraImage(CameraImage image) {
    try {
      // Konversi gambar dari YUV ke NV21
      Uint8List bytes = _convertYUV420ToNV21(image);

      final metadata = InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: InputImageRotationValue.fromRawValue(
                _cameraController!.description.sensorOrientation) ??
            InputImageRotation.rotation0deg,
        format: InputImageFormat.nv21,
        bytesPerRow: image.planes[0].bytesPerRow,
      );

      // Buat objek InputImage dari bytes yang sudah dikonversi
      return InputImage.fromBytes(bytes: bytes, metadata: metadata);
    } catch (e) {
      print('Error converting CameraImage to InputImage: $e');
      rethrow;
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _textRecognizer.close();
    super.dispose();
  }
}
