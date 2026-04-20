import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../services/department_service.dart';
import '../../services/president_service.dart';
import '../../services/touristic_service.dart';
import '../../services/typical_dish_service.dart';
import '../../widgets/estado_widget.dart';

class ListadoView extends StatefulWidget {
  final String tipo;
  const ListadoView({super.key, required this.tipo});

  @override
  State<ListadoView> createState() => _ListadoViewState();
}

class _ListadoViewState extends State<ListadoView> {
  bool _cargando = true;
  String? _error;
  List<dynamic> _items = [];

  @override
  void initState() {
    super.initState();
    _cargar();
  }

  Future<void> _cargar() async {
    setState(() { _cargando = true; _error = null; });
    try {
      List<dynamic> datos = [];
      switch (widget.tipo) {
        case 'department':
          datos = await DepartmentService().getAll();
          break;
        case 'president':
          datos = await PresidentService().getAll();
          break;
        case 'touristic':
          datos = await TouristicService().getAll();
          break;
        case 'dish':
          datos = await TypicalDishService().getAll();
          break;
      }
      setState(() { _items = datos; _cargando = false; });
    } catch (e) {
      setState(() { _error = e.toString(); _cargando = false; });
    }
  }

  String _titulo() {
    switch (widget.tipo) {
      case 'department': return 'Departamentos';
      case 'president':  return 'Presidentes';
      case 'touristic':  return 'Atracciones Turísticas';
      case 'dish':       return 'Platos Típicos';
      default:           return '';
    }
  }

  String _nombre(dynamic item) {
    try { return item.name as String; } catch (_) { return ''; }
  }

  String _subtitulo(dynamic item) {
    switch (widget.tipo) {
      case 'department': return 'Población: ${item.population}';
      case 'president':  return item.lastName as String;
      case 'touristic':  return item.cityName as String;
      case 'dish':       return item.region as String;
      default:           return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titulo())),
      body: EstadoWidget(
        cargando: _cargando,
        error: _error,
        onReintentar: _cargar,
        hijo: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            final item = _items[index];
            return ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(_nombre(item)),
              subtitle: Text(_subtitulo(item)),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.push('/detalle/${widget.tipo}/${item.id}'),
            );
          },
        ),
      ),
    );
  }
}