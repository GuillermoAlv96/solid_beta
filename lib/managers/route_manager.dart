import 'package:flutter/material.dart';
import 'package:solid_beta/providers/routing/routing_provider.dart';

// enum de las rutas de la app
enum RouteType {home, detail}

// extension de RouteType con getter del nombre de la ruta 
extension RouteTypeExtension on RouteType {
  String get name {
    switch (this) {
      case RouteType.home:
        return "home";
      case RouteType.detail:
        return "detail";
    }
  }
}

// clase para poder pasar argumentos
class ArgumentsModel {
  late final RouteType routeType;
  late final Object? parameters;

  ArgumentsModel(RouteType routeType, Object? parameters) {
    this.routeType = routeType;
    this.parameters = parameters;
  }
}

class RouteManager {
  late final RoutingProvider _routingProvider;

  RouteManager(RoutingProvider routingProvider) {
    this._routingProvider = routingProvider;
  }

  Route createRoute(Object? arguments) {
    if (arguments != null && arguments is ArgumentsModel) {
      switch (arguments.routeType) {
        case RouteType.home:
          return _getSlidePageRoute(
            view: _routingProvider.homeRouting(),
            routeName: arguments.routeType.name);
        case RouteType.detail:
          return _getSlidePageRoute(
            view: _routingProvider.detailRouting(),
            routeName: arguments.routeType.name);
      }
    } else {
      return _getSlidePageRoute(
          view: _routingProvider.homeRouting(),
          routeName: RouteType.home.name);
    }
  }

  PageRouteBuilder _getSlidePageRoute(
      {required Widget view, bool close = false, required String routeName}) {
    return PageRouteBuilder(
      settings: RouteSettings(name: routeName),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (context, animation, secondaryAnimation) => view,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(close ? -1.0 : 1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.decelerate;

        var tween = Tween(begin: begin, end: end);
        var curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
  }

}