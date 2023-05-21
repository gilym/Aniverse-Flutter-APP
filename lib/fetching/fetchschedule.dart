import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'dart:convert';

class getMonday {
  static Future<List<dynamic>> fetchday() async {
    List<dynamic> animeData = [];
    try {
      // ambil data pada halaman 1-5
      final url = "https://api.jikan.moe/v4/schedules?filter=monday";
      final file = await DefaultCacheManager().getSingleFile(url);
      final response = await file.readAsString().then((jsonString) => jsonDecode(jsonString));
      final data = response['data'] as List<dynamic>;
      animeData.addAll(data);

    } catch (error) {
      print(error);
    }
    return animeData;
  }
}
class getTuesday {
  static Future<List<dynamic>> fetchday() async {
    List<dynamic> animeData = [];
    try {
      // ambil data pada halaman 1-5
      final url = "https://api.jikan.moe/v4/schedules?filter=tuesday";
      final file = await DefaultCacheManager().getSingleFile(url);
      final response = await file.readAsString().then((jsonString) => jsonDecode(jsonString));
      final data = response['data'] as List<dynamic>;
      animeData.addAll(data);

    } catch (error) {
      print(error);
    }
    return animeData;
  }
}
class getWednesday {
  static Future<List<dynamic>> fetchday() async {
    List<dynamic> animeData = [];
    try {
      // ambil data pada halaman 1-5
      final url = "https://api.jikan.moe/v4/schedules?filter=wednesday";
      final file = await DefaultCacheManager().getSingleFile(url);
      final response = await file.readAsString().then((jsonString) => jsonDecode(jsonString));
      final data = response['data'] as List<dynamic>;
      animeData.addAll(data);

    } catch (error) {
      print(error);
    }
    return animeData;
  }
}
class getThursday {
  static Future<List<dynamic>> fetchday() async {
    List<dynamic> animeData = [];
    try {
      // ambil data pada halaman 1-5
      final url = "https://api.jikan.moe/v4/schedules?filter=thursday";
      final file = await DefaultCacheManager().getSingleFile(url);
      final response = await file.readAsString().then((jsonString) => jsonDecode(jsonString));
      final data = response['data'] as List<dynamic>;
      animeData.addAll(data);

    } catch (error) {
      print(error);
    }
    return animeData;
  }
}
class getFriday {
  static Future<List<dynamic>> fetchday() async {
    List<dynamic> animeData = [];
    try {
      // ambil data pada halaman 1-5
      final url = "https://api.jikan.moe/v4/schedules?filter=friday";
      final file = await DefaultCacheManager().getSingleFile(url);
      final response = await file.readAsString().then((jsonString) => jsonDecode(jsonString));
      final data = response['data'] as List<dynamic>;
      animeData.addAll(data);

    } catch (error) {
      print(error);
    }
    return animeData;
  }
}
class getSaturday {
  static Future<List<dynamic>> fetchday() async {
    List<dynamic> animeData = [];
    try {
      // ambil data pada halaman 1-5
      final url = "https://api.jikan.moe/v4/schedules?filter=saturday";
      final file = await DefaultCacheManager().getSingleFile(url);
      final response = await file.readAsString().then((jsonString) => jsonDecode(jsonString));
      final data = response['data'] as List<dynamic>;
      animeData.addAll(data);

    } catch (error) {
      print(error);
    }
    return animeData;
  }
}
class getSunday {
  static Future<List<dynamic>> fetchday() async {
    List<dynamic> animeData = [];
    try {
      // ambil data pada halaman 1-5
      final url = "https://api.jikan.moe/v4/schedules?filter=sunday";
      final file = await DefaultCacheManager().getSingleFile(url);
      final response = await file.readAsString().then((jsonString) => jsonDecode(jsonString));
      final data = response['data'] as List<dynamic>;
      animeData.addAll(data);

    } catch (error) {
      print(error);
    }
    return animeData;
  }
}