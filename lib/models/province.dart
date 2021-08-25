class ProvinceInfo {
  String? provinceId;
  String? provinceName;

  ProvinceInfo({this.provinceId, this.provinceName});

  ProvinceInfo.fromJson(Map<String, dynamic> parsedJson) {
    this.provinceId = parsedJson["id"];
    this.provinceName = parsedJson["value"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.provinceId;
    data["value"] = this.provinceName;

    return data;
  }
}

class ProvinceList {
  List<ProvinceInfo>? provinces;

  ProvinceList({this.provinces});

  ProvinceList.fromJson(Map<String, dynamic> parsedJson) {
    List<ProvinceInfo> data = [];
    for (dynamic provinceData in parsedJson["provinces"]) {
      data.add(ProvinceInfo.fromJson(provinceData));
    }

    this.provinces = data;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["provinces"] = this.provinces;

    return data;
  }
}
