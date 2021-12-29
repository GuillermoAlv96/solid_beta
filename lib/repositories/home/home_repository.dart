

import 'package:solid_beta/repositories/home/home_repository_protocol.dart';
import 'package:solid_beta/services/protocols/home_service_protocol.dart';

class HomeRepository implements HomeRepositoryProtocol {

  final HomeServiceProtocol _homeService;

  HomeRepository(HomeServiceProtocol homeService)
      : this._homeService = homeService;

  @override
  Future<String> getHomePageData() {
    // TODO: implement getHomePageData
    throw UnimplementedError();
  }

}