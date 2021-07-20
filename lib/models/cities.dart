class CityInfo {
  String? cityId;
  String? cityName;

  CityInfo({this.cityId, this.cityName});

  CityInfo.fromJson(Map<String, dynamic> parsedJson) {
    this.cityId = parsedJson["id"];
    this.cityName = parsedJson["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.cityId;
    data["name"] = this.cityName;

    return data;
  }
}

class CityList {
  List<CityInfo>? cities;

  CityList({this.cities});

  CityList.fromJson(Map<String, dynamic> parsedJson) {
    List<CityInfo> data = [];
    for (dynamic cityData in parsedJson["cities"]) {
      data.add(CityInfo.fromJson(cityData));
    }

    this.cities = data;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["cities"] = this.cities;

    return data;
  }
}
