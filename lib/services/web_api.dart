import 'package:covidgraph/models/city.dart';
import 'package:covidgraph/models/hospitalMap.dart';
import 'package:covidgraph/models/vaccinationInfo.dart';
import 'package:covidgraph/models/province.dart';
import 'package:covidgraph/models/bedDetail.dart';
import 'package:covidgraph/models/hospital.dart';
import 'package:covidgraph/models/covidStats.dart';

abstract class WebApi {
  Future<ProvinceList> getProvincesList({Map<String, dynamic>? requestParams});
  Future<CityList> getCitiesList({Map<String, dynamic>? requestParams});
  Future<HospitalList> getHospitalsByParams({Map<String, dynamic>? requestParams});
  Future<BedInfoList> getBedDetails({required Map<String, dynamic> requestParams});
  Future<HospitalMapData> getMapsOfHospital({required Map<String, dynamic> requestParams});
  Future<List<VaccinationInfo>> getVaccinationInfo();
  Future<List<NationalCovidStats>> getNationalCovidStats();
  Future<List<ProvinceCovidStats>> getProvinceCovidStatsList();
}
