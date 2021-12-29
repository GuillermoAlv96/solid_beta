import 'package:flutter/material.dart';
import 'package:solid_beta/managers/navigation_manager.dart';
import 'package:solid_beta/modules/detail/view/detail_page.dart';

class DetailRouting extends StatelessWidget {
  late final NavigationManager _navigationManager;

  DetailRouting(NavigationManager navigationManager) {
    _navigationManager = navigationManager;
  }

  @override
  Widget build(BuildContext context) {
    return DetailPage();
  }
}