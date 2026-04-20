import 'package:go_router/go_router.dart';
import '../views/dashboard/dashboard_view.dart';
import '../views/listado/listado_view.dart';
import '../views/detalle/detalle_view.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const DashboardView(),
    ),
    GoRoute(
      path: '/listado/:tipo',
      builder: (context, state) {
        final tipo = state.pathParameters['tipo']!;
        return ListadoView(tipo: tipo);
      },
    ),
    GoRoute(
      path: '/detalle/:tipo/:id',
      builder: (context, state) {
        final tipo = state.pathParameters['tipo']!;
        final id   = int.parse(state.pathParameters['id']!);
        return DetalleView(tipo: tipo, id: id);
      },
    ),
  ],
);