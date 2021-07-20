import 'package:covidgraph/models/cities.dart';
import 'package:covidgraph/utils/network.dart';
import 'package:covidgraph/models/provinces.dart';

abstract class WebApi {
  Future<ProvinceList> getProvincesList({Map<String, dynamic>? requestParams});
  Future<CityList> getCitiesList({Map<String, dynamic>? requestParams});
  Future<List<NetworkModel>> getHospitalsByParams({Map<String, dynamic>? requestParams});
  Future<List<NetworkModel>> getBedDetails({required Map<String, dynamic> requestParams});
  Future<List<NetworkModel>> getMapsOfHospital({required Map<String, dynamic> requestParams});

  Future<List<NetworkModel>> getVaccinationInfo();
}