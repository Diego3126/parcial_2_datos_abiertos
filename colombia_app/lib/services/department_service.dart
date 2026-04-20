import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/app_config.dart';
import '../models/department_model.dart';

class DepartmentService {
  Future<List<Department>> getAll() async {
    final url = Uri.parse('${AppConfig.baseUrl}/Department');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => Department.fromJson(e)).toList();
    }
    throw Exception('Error al cargar departamentos');
  }

  Future<Department> getById(int id) async {
    final url = Uri.parse('${AppConfig.baseUrl}/Department/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Department.fromJson(json.decode(response.body));
    }
    throw Exception('Error al cargar departamento');
  }
}