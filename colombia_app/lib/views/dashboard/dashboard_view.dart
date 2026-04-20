import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../themes/app_theme.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  static const List<Map<String, dynamic>> _cards = [
    {
      'tipo':     'department',
      'titulo':   'Departamentos',
      'subtitulo':'Explora los 32 departamentos de Colombia',
      'icono':    Icons.map,
      'color':    AppTheme.secondary,
    },
    {
      'tipo':     'president',
      'titulo':   'Presidentes',
      'subtitulo':'Historia de los presidentes de Colombia',
      'icono':    Icons.account_balance,
      'color':    AppTheme.accent,
    },
    {
      'tipo':     'touristic',
      'titulo':   'Atracciones Turísticas',
      'subtitulo':'Lugares increíbles para visitar',
      'icono':    Icons.place,
      'color':    Colors.green,
    },
    {
      'tipo':     'dish',
      'titulo':   'Platos Típicos',
      'subtitulo':'La gastronomía colombiana',
      'icono':    Icons.restaurant,
      'color':    Colors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🇨🇴 Colombia App')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Datos Abiertos de Colombia',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Selecciona una categoría para explorar',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: _cards.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  final card = _cards[index];
                  return GestureDetector(
                    onTap: () => context.push('/listado/${card['tipo']}'),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 32,
                              backgroundColor: (card['color'] as Color).withOpacity(0.15),
                              child: Icon(
                                card['icono'] as IconData,
                                size: 36,
                                color: card['color'] as Color,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              card['titulo'],
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              card['subtitulo'],
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}