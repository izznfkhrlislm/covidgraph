import 'package:covidgraph/models/covidStats.dart';
import 'package:covidgraph/models/province.dart';
import 'package:covidgraph/models/city.dart';
import 'package:covidgraph/models/bedDetail.dart';
import 'package:covidgraph/models/hospital.dart';
import 'package:covidgraph/models/hospitalMap.dart';
import 'package:covidgraph/models/vaccinationInfo.dart';
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
  Future<HospitalMapData> getMapsOfHospital({required Map<String, dynamic> requestParams}) async {
    NetworkModel getModel;
    dynamic apiResponse;
    HospitalMapData model;

    try {
      getModel = await _networkInterface.get(
        baseUrl: "carirs-api.mgilangjanuar.com",
        path: "maps",
        queryParams: requestParams,
      );
      apiResponse = getModel.response;
      model = HospitalMapData.fromJson(apiResponse);
    } on NetworkException catch (_) {
      rethrow;
    }

    return model;
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
  Future<List<VaccinationInfo>> getVaccinationInfo() async {
    NetworkModel getModel;
    dynamic apiResponse;
    List<VaccinationInfo> modelList = [];

    try {
      getModel = await _networkInterface.getGeneric(
        baseUrl: "vaksin-jakarta.yggdrasil.id",
      );
      apiResponse = getModel.response;
      for (dynamic data in apiResponse) {
        modelList.add(VaccinationInfo.fromJson(data));
      }
    } on NetworkException catch (_) {
      rethrow;
    }

    return modelList;
  }

  @override
  Future<List<NationalCovidStats>> getNationalCovidStats() async {
    NetworkModel getModel;
    dynamic apiResponse;
    List<NationalCovidStats> modelList = [];

    try {
      getModel = await _networkInterface.getGeneric(
        baseUrl: "api.kawalcorona.com",
        path: "indonesia",
      );
      apiResponse = getModel.response;
      for (dynamic data in apiResponse) {
        modelList.add(NationalCovidStats.fromJson(data));
      }
    } on NetworkException catch (_) {
      rethrow;
    }

    return modelList;
  }

  @override
  Future<List<ProvinceCovidStats>> getProvinceCovidStatsList() async {
    NetworkModel getModel;
    dynamic apiResponse;
    List<ProvinceCovidStats> modelList = [];

    try {
      getModel = await _networkInterface.getGeneric(
        baseUrl: "api.kawalcorona.com",
        path: "indonesia/provinsi",
      );
      apiResponse = getModel.response;
      for (dynamic data in apiResponse) {
        modelList.add(ProvinceCovidStats.fromJson(data));
      }
    } on NetworkException catch (_) {
      rethrow;
    }

    return modelList;
  }
}
