import 'package:covidgraph/enums/view_state.dart';
import 'package:covidgraph/models/province.dart';
import 'package:covidgraph/services/serviceLocator.dart';
import 'package:covidgraph/services/web_api_prod.dart';
import 'package:covidgraph/viewmodels/base_view_models.dart';

class ProvinceListViewModel extends BaseViewModel {
  WebApiProd _apiProd = serviceLocator<WebApiProd>();

  late ProvinceList provinceList;

  Future fetchProvinceList(String query) async {
    Map<String, dynamic> requestParams = {
      "q": query,
    };

    setState(ViewState.Busy);
    provinceList = await _apiProd.getProvincesList(
      requestParams: requestParams,
    );
    setState(ViewState.Idle);
  }
}
