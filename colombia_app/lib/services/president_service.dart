import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/app_config.dart';
import '../models/president_model.dart';

class PresidentService {
  Future<List<President>> getAll() async {
    final url = Uri.parse('${AppConfig.baseUrl}/President');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => President.fromJson(e)).toList();
    }
    throw Exception('Error al cargar presidentes');
  }

  Future<President> getById(int id) async {
    final url = Uri.parse('${AppConfig.baseUrl}/President/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return President.fromJson(json.decode(response.body));
    }
    throw Exception('Error al cargar presidente');
  }
}