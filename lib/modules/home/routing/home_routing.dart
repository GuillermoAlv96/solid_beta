import 'package:flutter/material.dart';
import 'package:solid_beta/managers/navigation_manager.dart';
import 'package:solid_beta/modules/home/view/home_page.dart';
import 'package:solid_beta/repositories/home/home_repository_protocol.dart';

class HomeRouting extends StatelessWidget {
  late final NavigationManager _navigationManager;
  late final HomeRepositoryProtocol _homeRepository;

  HomeRouting(NavigationManager navigationManager,
      HomeRepositoryProtocol homeRepository) {
    _navigationManager = navigationManager;
    _homeRepository = homeRepository;
  }


  @override
  Widget build(BuildContext context) {
    return HomePage();
  }

  void showDetail(BuildContext context) {
    _navigationManager.showDetail(context);
  }
}