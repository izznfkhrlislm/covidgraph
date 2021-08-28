import 'package:covidgraph/utils/network.dart';
import 'package:covidgraph/services/web_api_prod.dart';
import 'package:covidgraph/viewmodels/covid_stats_view_models.dart';
import 'package:covidgraph/viewmodels/provinces_list_view_model.dart';
import 'package:covidgraph/viewmodels/vaccination_info_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton(() => NetworkInterface());
  serviceLocator.registerLazySingleton(() => WebApiProd());

  /// View Models
  serviceLocator.registerLazySingleton(() => CovidStatsViewModel());
  serviceLocator.registerLazySingleton(() => ProvinceListViewModel());
  serviceLocator.registerLazySingleton(() => VaccinationInfoViewModel());
}
