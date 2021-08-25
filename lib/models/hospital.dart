import 'package:covidgraph/models/city.dart';
import 'package:covidgraph/models/province.dart';

class HospitalInfo {
  List<String>? tags;
  String? hospitalId;
  String? hospitalName;
  String? hospitalAddress;
  String? phoneNumber;
  ProvinceInfo? province;
  CityInfo? city;

  HospitalInfo({
    this.tags,
    this.hospitalId,
    this.hospitalName,
    this.hospitalAddress,
    this.phoneNumber,
    this.province,
    this.city,
  });

  HospitalInfo.fromJson(Map<String, dynamic> parsedJson) {
    this.tags = parsedJson["tags"];
    this.hospitalId = parsedJson["id"];
    this.hospitalName = parsedJson["name"];
    this.hospitalAddress = parsedJson["address"];
    this.phoneNumber = parsedJson["phoneNumber"];
    this.province = parsedJson["province"] == null ? ProvinceInfo() : ProvinceInfo.fromJson(parsedJson["province"]);
    this.city = parsedJson["city"] == null ? CityInfo() : CityInfo.fromJson(parsedJson["city"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["tags"] = this.tags;
    data["id"] = this.hospitalId;
    data["name"] = this.hospitalName;
    data["address"] = this.hospitalAddress;
    data["phoneNumber"] = this.phoneNumber;
    data["province"] = this.province!.toJson();
    data["city"] = this.city!.toJson();

    return data;
  }
}

class HospitalList {
  String? info;
  List<HospitalInfo>? hospitals;

  HospitalList({
    this.info,
    this.hospitals,
  });

  HospitalList.fromJson(Map<String, dynamic> parsedJson) {
    this.info = parsedJson["info"];
    List<HospitalInfo> data = [];
    for (dynamic hospitalData in parsedJson["hospitals"]) {
      data.add(HospitalInfo.fromJson(hospitalData));
    }
    this.hospitals = data;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["info"] = this.info;
    data["hospitals"] = this.hospitals;

    return data;
  }
}
