import 'package:covidgraph/models/provinces.dart';
import 'package:covidgraph/models/cities.dart';
import 'package:covidgraph/models/bedDetails.dart';
import 'package:covidgraph/models/hospitals.dart';
import 'package:covidgraph/services/serviceLocator.dart';
import 'package:covidgraph/services/web_api.dart';
import 'package:covidgraph/utils/network.dart';

class WebApiProd implements WebApi {
  NetworkInterface _networkInterface = serviceLocator<NetworkInterface>();

  @override
  Future<BedInfoList> getBedDetails({required Map<String, dynamic> requestParams}) async {
    NetworkModel getModel;
    dynamic apiResponse;
    BedInfoList model;

    try {
      getModel = await _networkInterface.get(
        baseUrl: "carirs-api.mgilangjanuar.com",
        path: "cities",
        queryParams: requestParams,
      );
      apiResponse = getModel.response;
      model = BedInfoList.fromJson(apiResponse);
    } on NetworkException catch (_) {
      rethrow;
    }

    return model;
  }

  @override
  Future<CityList> getCitiesList({Map<String, dynamic>? requestParams}) async {
    NetworkModel getModel;
    dynamic apiResponse;
    CityList model;

    try {
      getModel = await _networkInterface.get(
        baseUrl: "carirs-api.mgilangjanuar.com",
        path: "cities",
        queryParams: requestParams ?? null,
      );
      apiResponse = getModel.response;
      model = CityList.fromJson(apiResponse);
    } on NetworkException catch (_) {
      rethrow;
    }

    return model;
  }

  @override
  Future<HospitalList> getHospitalsByParams({Map<String, dynamic>? requestParams}) async {
    NetworkModel getModel;
    dynamic apiResponse;
    HospitalList model;

    try {
      getModel = await _networkInterface.get(
        baseUrl: "carirs-api.mgilangjanuar.com",
        path: "hospitals",
        queryParams: requestParams ?? null,
      );
      apiResponse = getModel.response;
      model = HospitalList.fromJson(apiResponse);
    } on NetworkException catch (_) {
      rethrow;
    }

    return model;
  }

  @override
  Future<List<NetworkModel>> getMapsOfHospital({required Map<String, dynamic> requestParams}) {
    // TODO: implement getMapsOfHospital
    throw UnimplementedError();
  }

  @override
  Future<ProvinceList> getProvincesList({Map<String, dynamic>? requestParams}) async {
    NetworkModel getModel;
    dynamic apiResponse;
    ProvinceList model;

    try {
      getModel = await _networkInterface.get(
        baseUrl: "carirs-api.mgilangjanuar.com",
        path: "provinces",
        queryParams: requestParams ?? null,
      );
      apiResponse = getModel.response;
      model = ProvinceList.fromJson(apiResponse);
    } on NetworkException catch (_) {
      rethrow;
    }

    return model;
  }

  @override
  Future<List<NetworkModel>> getVaccinationInfo() {
    // TODO: implement getVaccinationInfo
    throw UnimplementedError();
  }
}
