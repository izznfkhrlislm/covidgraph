import 'package:covidgraph/utils/network.dart';
import 'package:covidgraph/services/web_api_prod.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton(() => NetworkInterface());
  serviceLocator.registerLazySingleton(() => WebApiProd());
}
