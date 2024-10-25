import 'package:flutter/material.dart';
import 'landing_state.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LandingProvider extends ChangeNotifier {
  final state = LandingState();

  final List<Map<String, String>> historyData = [
    {
      'title': 'Gedung Sate',
      'latitude': '7.250°',
      'longitude': '112.768°',
      'address': 'FQWX+43 Obama, Prefektur Fukui, Jepang',
      'image': 'https://dummyimage.com/250/ffffff/000000'
    },
    {
      'title': 'Borobudur Temple',
      'latitude': '7.6079°',
      'longitude': '110.2038°',
      'address': 'Jalan Venus No 31 Malang XX',
      'image': 'https://dummyimage.com/250/ffffff/000000'
    },
    {
      'title': 'Mount Bromo',
      'latitude': '-7.9425°',
      'longitude': '112.953°',
      'address': 'Jalan Venus No 31 Malang XX',
      'image': 'https://dummyimage.com/250/ffffff/000000'
    },
  ];
}
