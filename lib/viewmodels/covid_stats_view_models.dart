import 'package:covidgraph/models/covidStats.dart';
import 'package:covidgraph/services/serviceLocator.dart';
import 'package:covidgraph/services/web_api_prod.dart';
import 'package:covidgraph/viewmodels/base_view_models.dart';
import 'package:covidgraph/enums/view_state.dart';

class CovidStatsViewModel extends BaseViewModel {
  WebApiProd _apiProd = serviceLocator<WebApiProd>();

  static const PROVINCE_NAMES = [
    "DKI Jakarta",
    "Jawa Barat",
    "Jawa Tengah",
    "Jawa Timur",
    "Bali",
  ];

  late List<NationalCovidStats> nationalCovidStats;
  late List<ProvinceCovidStats> provinceCovidStats;
  List<ProvinceCovidStats> finalData = [];

  Future fetchNationalCovidStatsData() async {
    setState(ViewState.Busy);
    nationalCovidStats = await _apiProd.getNationalCovidStats();
    setState(ViewState.Idle);
  }

  Future<List<ProvinceCovidStats>> fetchProvinceCovidStatsData() async {
    setState(ViewState.Busy);
    provinceCovidStats = await _apiProd.getProvinceCovidStatsList();
    for (ProvinceCovidStats data in provinceCovidStats) {
      if (PROVINCE_NAMES.contains(data.attributes!.name)) {
        finalData.add(data);
      }
    }
    setState(ViewState.Idle);

    return finalData;
  }
}
