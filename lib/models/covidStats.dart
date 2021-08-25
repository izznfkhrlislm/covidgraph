class NationalCovidStats {
  String? countryName;
  String? activeCases;
  String? curedCases;
  String? deaths;

  NationalCovidStats({
    this.countryName,
    this.activeCases,
    this.curedCases,
    this.deaths,
  });

  NationalCovidStats.fromJson(Map<String, dynamic> parsedJson) {
    this.countryName = parsedJson["name"];
    this.activeCases = parsedJson["positif"];
    this.curedCases = parsedJson["sembuh"];
    this.deaths = parsedJson["meninggal"];
  }
}

class ProvinceCovidStatsAttribute {
  String? fid;
  String? provinceCode;
  String? name;
  int? activeCases;
  int? curedCases;
  int? deaths;

  ProvinceCovidStatsAttribute({
    this.fid,
    this.provinceCode,
    this.name,
    this.activeCases,
    this.curedCases,
    this.deaths,
  });

  ProvinceCovidStatsAttribute.fromJson(Map<String, dynamic> parsedJson) {
    this.fid = parsedJson["FID"];
    this.provinceCode = parsedJson["Kode_Provi"];
    this.name = parsedJson["Provinsi"];
    this.activeCases = parsedJson["Kasus_Posi"];
    this.curedCases = parsedJson["Kasus_Semb"];
    this.deaths = parsedJson["Kasus_Meni"];
  }
}

class ProvinceCovidStats {
  ProvinceCovidStatsAttribute? attributes;

  ProvinceCovidStats({
    this.attributes,
  });

  ProvinceCovidStats.fromJson(Map<String, dynamic> parsedJson) {
    this.attributes = ProvinceCovidStatsAttribute.fromJson(parsedJson["attributes"]);
  }
}
