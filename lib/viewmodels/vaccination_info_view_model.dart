import 'package:covidgraph/enums/view_state.dart';
import 'package:covidgraph/models/vaccinationInfo.dart';
import 'package:covidgraph/services/serviceLocator.dart';
import 'package:covidgraph/services/web_api_prod.dart';
import 'package:covidgraph/viewmodels/base_view_models.dart';

class VaccinationInfoViewModel extends BaseViewModel {
  WebApiProd _apiProd = serviceLocator<WebApiProd>();

  late List<VaccinationInfo> vaccinationInfo;

  Future fetchVaccinationInfoData() async {
    setState(ViewState.Busy);
    vaccinationInfo = await _apiProd.getVaccinationInfo();
    setState(ViewState.Idle);
  }
}
