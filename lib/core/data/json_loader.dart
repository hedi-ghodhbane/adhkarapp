import 'dart:convert';
import 'package:flutter/services.dart';

class JsonLoader {
  Future<Map<String, dynamic>> loadJson() async {
    final response = await rootBundle.loadString('assets/data/adhkar.json');
    final data = await json.decode(response);
    return data;
  }
}
