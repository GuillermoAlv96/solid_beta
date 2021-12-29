

import 'package:solid_beta/providers/repository/repository_provider_protocol.dart';
import 'package:solid_beta/repositories/home/home_repository.dart';
import 'package:solid_beta/repositories/home/home_repository_protocol.dart';

class RepositoryProvider implements RepositoryProviderProtocol{

  @override
  HomeRepositoryProtocol homeRepository() {
    return HomeRepository();
  }

}