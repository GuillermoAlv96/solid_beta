import 'package:flutter/material.dart';
import 'package:solid_beta/managers/route_manager.dart';
import 'package:solid_beta/modules/detail/view/detail_page.dart';
import 'package:solid_beta/modules/home/view/home_page.dart';


class NavigationManager {
  void showHome(BuildContext context, [bool close = false]) {
    Navigator.pushNamed(context, HomePage.routeName,
        arguments: ArgumentsModel(RouteType.home, close));
  }

  void showDetail(BuildContext context, [bool close = false]) {
    Navigator.pushNamed(context, DetailPage.routeName,
        arguments: ArgumentsModel(RouteType.detail, close));
  }

  void pop(BuildContext context, [dynamic result]) {
    Navigator.pop(context, result);
  }
}