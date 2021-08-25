class HospitalMaps {
  String? url;
  String? urlAlt1;
  String? urlAlt2;
  double? lat;
  double? long;

  HospitalMaps({
    this.url,
    this.urlAlt1,
    this.urlAlt2,
    this.lat,
    this.long,
  });

  HospitalMaps.fromJson(Map<String, dynamic> parsedJson) {
    this.url = parsedJson["url"];
    this.urlAlt1 = parsedJson["urlAlt1"];
    this.urlAlt2 = parsedJson["urlAlt2"];
    this.lat = parsedJson["lat"];
    this.long = parsedJson["long"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["url"] = this.url;
    data["urlAlt1"] = this.urlAlt1;
    data["urlAlt2"] = this.urlAlt2;
    data["lat"] = this.lat;
    data["long"] = this.long;

    return data;
  }
}

class HospitalMapData {
  HospitalMaps? maps;

  HospitalMapData({this.maps});

  HospitalMapData.fromJson(Map<String, dynamic> parsedJson) {
    this.maps = HospitalMaps.fromJson(parsedJson["maps"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["maps"] = this.maps?.toJson();

    return data;
  }
}
