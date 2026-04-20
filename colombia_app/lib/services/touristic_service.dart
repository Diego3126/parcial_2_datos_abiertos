import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/app_config.dart';
import '../models/touristic_attraction_model.dart';

class TouristicService {
  Future<List<TouristicAttraction>> getAll() async {
    final url = Uri.parse('${AppConfig.baseUrl}/TouristicAttraction');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => TouristicAttraction.fromJson(e)).toList();
    }
    throw Exception('Error al cargar atracciones turísticas');
  }

  Future<TouristicAttraction> getById(int id) async {
    final url = Uri.parse('${AppConfig.baseUrl}/TouristicAttraction/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return TouristicAttraction.fromJson(json.decode(response.body));
    }
    throw Exception('Error al cargar atracción turística');
  }
}