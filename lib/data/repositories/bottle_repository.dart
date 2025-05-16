import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/bottle_model.dart';

class BottleRepository {
  Future<List<Bottle>> fetchBottles() async {
    final connectivity = await Connectivity().checkConnectivity();
    final prefs = await SharedPreferences.getInstance();
    List<Bottle> bottles = [];

    if (connectivity != ConnectivityResult.none) {
      final response = await rootBundle.loadString('assets/mock_bottles.json');
      final List<dynamic> data = json.decode(response);
      bottles = data.map((item) => Bottle.fromJson(item)).toList();

      prefs.setString('bottles_cache', json.encode(data));
    } else {
      final cachedData = prefs.getString('bottles_cache');
      if (cachedData != null) {
        final List<dynamic> data = json.decode(cachedData);
        bottles = data.map((item) => Bottle.fromJson(item)).toList();
      }
    }

    return bottles;
  }
}