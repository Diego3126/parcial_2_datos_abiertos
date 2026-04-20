import 'package:flutter/material.dart';
import '../../services/department_service.dart';
import '../../services/president_service.dart';
import '../../services/touristic_service.dart';
import '../../services/typical_dish_service.dart';
import '../../widgets/estado_widget.dart';

class DetalleView extends StatefulWidget {
  final String tipo;
  final int id;
  const DetalleView({super.key, required this.tipo, required this.id});

  @override
  State<DetalleView> createState() => _DetalleViewState();
}

class _DetalleViewState extends State<DetalleView> {
  bool _cargando = true;
  String? _error;
  dynamic _item;

  @override
  void initState() {
    super.initState();
    _cargar();
  }

  Future<void> _cargar() async {
    setState(() { _cargando = true; _error = null; });
    try {
      dynamic dato;
      switch (widget.tipo) {
        case 'department':
          dato = await DepartmentService().getById(widget.id);
          break;
        case 'president':
          dato = await PresidentService().getById(widget.id);
          break;
        case 'touristic':
          dato = await TouristicService().getById(widget.id);
          break;
        case 'dish':
          dato = await TypicalDishService().getById(widget.id);
          break;
      }
      setState(() { _item = dato; _cargando = false; });
    } catch (e) {
      setState(() { _error = e.toString(); _cargando = false; });
    }
  }

  Widget _buildDetalle() {
    final item = _item;
    switch (widget.tipo) {
      case 'department':
        return _buildInfo([
          _fila('Nombre',     item.name),
          _fila('Superficie', item.surface),
          _fila('Población',  '${item.population}'),
          _fila('Descripción',item.description),
        ]);
      case 'president':
        return _buildInfo([
          _fila('Nombre',      '${item.name} ${item.lastName}'),
          _fila('Inicio',      item.startPeriodDate),
          _fila('Fin',         item.endPeriodDate),
          _fila('Descripción', item.description),
          if (item.image.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  item.image,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.person, size: 80),
                ),
              ),
            ),
        ]);
      case 'touristic':
        return _buildInfo([
          _fila('Nombre',      item.name),
          _fila('Ciudad',      item.cityName),
          _fila('Latitud',     item.latitude),
          _fila('Longitud',    item.longitude),
          _fila('Descripción', item.description),
        ]);
      case 'dish':
        return _buildInfo([
          _fila('Nombre',      item.name),
          _fila('Región',      item.region),
          _fila('Descripción', item.description),
          if (item.image.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  item.image,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.restaurant, size: 80),
                ),
              ),
            ),
        ]);
      default:
        return const SizedBox();
    }
  }

  Widget _buildInfo(List<Widget> filas) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: filas,
      ),
    );
  }

  Widget _fila(String etiqueta, String valor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(etiqueta,
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600)),
          const SizedBox(height: 2),
          Text(valor, style: const TextStyle(fontSize: 15)),
          const Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_item != null ? (_item.name ?? 'Detalle') : 'Detalle')),
      body: EstadoWidget(
        cargando: _cargando,
        error: _error,
        onReintentar: _cargar,
        hijo: _buildDetalle(),
      ),
    );
  }
}