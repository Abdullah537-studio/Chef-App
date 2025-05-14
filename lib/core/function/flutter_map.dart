// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:chef_app/core/model/location.dart';
import 'dart:convert';

LocationModel infoLocation() {
  return LocationModel(
    address: "",
    latitude: 0,
    longitude: 0,
    name: "",
  );
}

Future<List<LocationModel>> fetchLocations(String query) async {
  final url = Uri.parse(
      'https://nominatim.openstreetmap.org/search?q=$query&format=json&addressdetails=1');

  final response = await http.get(url,
      headers: {"User-Agent": "chef_App/1.0 (abd.allah.alnahas.96@gmail.com)"});

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data
        .map((jsonItem) => LocationModel.fromNominatimJson(jsonItem))
        .toList();
  } else {
    throw Exception('Failed to load location data');
  }
}
