class LocationState {
  String recognizedText = '';
  double? latitude;
  double? longitude;

  // Fungsi untuk mengatur teks hasil OCR
  void setRecognizedText(String text) {
    recognizedText = text;
  }

  // Fungsi untuk mengatur lokasi
  void setLocation(double lat, double lng) {
    latitude = lat;
    longitude = lng;
  }
}
