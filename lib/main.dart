import 'package:flutter/material.dart';
import 'package:solid_beta/managers/route_manager.dart';
import 'package:solid_beta/providers/repository/repository_provider.dart';
import 'package:solid_beta/providers/routing/routing_provider.dart';

void main() {
  final _provider = RepositoryProvider();
  final _routingProvider = RoutingProvider();
  final _routeManager = RouteManager(_routingProvider);

  runApp(MyApp(
    routeManager: _routeManager,
    repositoryProvider: _provider,
  ));
}

class MyApp extends StatelessWidget {
  final RouteManager routeManager;
  final RepositoryProvider repositoryProvider;

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  MyApp({required this.routeManager, required this.repositoryProvider});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SOLID beta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteType.home.name,
      onGenerateRoute: (settings) {
        final args = settings.arguments;
        for (RouteType value in RouteType.values) {
          if (value.name == settings.name) {
            return routeManager.createRoute(args);
          }
        }
      }
    );
  }
}
