import 'package:solid_beta/managers/navigation_manager.dart';
import 'package:solid_beta/modules/detail/routing/detail_routing.dart';
import 'package:solid_beta/modules/home/routing/home_routing.dart';
import 'package:solid_beta/providers/repository/repository_provider.dart';
import 'package:solid_beta/providers/repository/repository_provider_protocol.dart';

class RoutingProvider {
  late final NavigationManager _navigationManager;
  late final RepositoryProviderProtocol _repositoryProvider;

  RoutingProvider() {
    this._navigationManager = NavigationManager();
    this._repositoryProvider = RepositoryProvider();
  }

  HomeRouting homeRouting() {
      return HomeRouting(
        _navigationManager,
        _repositoryProvider.homeRepository()
      );
  }

  DetailRouting detailRouting() {
    return DetailRouting(
      _navigationManager
    );
  }
  
}