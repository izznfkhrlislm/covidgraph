class VaccinationQuotaInfo {
  int? totalQuota;
  int? quotaRemaining;
  String? jakiQuotaStatus;

  VaccinationQuotaInfo({
    this.totalQuota,
    this.quotaRemaining,
    this.jakiQuotaStatus
  });

  VaccinationQuotaInfo.fromJson(Map<String, dynamic> parsedJson) {
    this.totalQuota = parsedJson["totalKuota"];
    this.quotaRemaining = parsedJson["sisaKuota"];
    this.jakiQuotaStatus = parsedJson["jakiKuota"];
  }
}

class VaccinationTimeInfo {
  String? id;
  String? label;
  VaccinationQuotaInfo? vaccinationQuota;

  VaccinationTimeInfo({
    this.id,
    this.label,
    this.vaccinationQuota
  });

  VaccinationTimeInfo.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson["id"];
    this.label = parsedJson["label"];
    this.vaccinationQuota = VaccinationQuotaInfo.fromJson(parsedJson["kuota"]);
  }
}

class VaccinationScheduleInfo {
  String? id;
  String? label;
  int? locationCode;
  int? totalQuota;
  int? remainingQuota;
  List<VaccinationTimeInfo>? times;

  VaccinationScheduleInfo({
    this.id,
    this.label,
    this.locationCode,
    this.totalQuota,
    this.remainingQuota,
    this.times
  });

  VaccinationScheduleInfo.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson["id"];
    this.label = parsedJson["label"];
    this.locationCode = parsedJson["kode_lokasi_vaksinasi"];
    this.totalQuota = parsedJson["kuota"];
    this.remainingQuota = parsedJson["kuota_sisa"];

    List<VaccinationTimeInfo> vaccinationTimeInfos = [];
    for (dynamic data in parsedJson["waktu"]) {
      vaccinationTimeInfos.add(VaccinationTimeInfo.fromJson(data));
    }
    this.times = vaccinationTimeInfos;
  }
}

class VaccinationLocationDetail {
  int? placeId;
  String? osmType;
  int? osmId;
  List<String>? boundingBox;
  String? lat;
  String? long;
  String? displayName;

  VaccinationLocationDetail({
    this.placeId,
    this.osmType,
    this.osmId,
    this.boundingBox,
    this.lat,
    this.long,
    this.displayName,
  });

  VaccinationLocationDetail.fromJson(Map<String, dynamic> parsedJson) {
    this.placeId = parsedJson["place_id"];
    this.osmType = parsedJson["osm_type"];
    this.osmId = parsedJson["osm_id"];
    this.boundingBox = parsedJson["boundingBox"];
    this.lat = parsedJson["lat"];
    this.long = parsedJson["lon"];
    this.displayName = parsedJson["display_name"];
  }
}

class VaccinationInfo {
  int? vaccinationLocationCode;
  String? name;
  String? fullAddress;
  String? regencyName;
  String? district;
  String? ward;
  String? rt;
  String? rw;
  String? postalZip;
  String? faskesType;
  int? vaccinatorTeamCount;
  String? faskesName;
  String? openRegis;
  bool? isOpenForSecondDose;
  bool? isPcare;
  List<VaccinationScheduleInfo>? schedule;
  List<VaccinationLocationDetail>? locationDetails;

  VaccinationInfo({
    this.vaccinationLocationCode,
    this.name,
    this.fullAddress,
    this.regencyName,
    this.district,
    this.ward,
    this.rt,
    this.rw,
    this.postalZip,
    this.faskesType,
    this.vaccinatorTeamCount,
    this.faskesName,
    this.openRegis,
    this.isOpenForSecondDose,
    this.isPcare,
    this.schedule,
    this.locationDetails,
  });

  VaccinationInfo.fromJson(Map<String, dynamic> parsedJson) {
    this.vaccinationLocationCode = parsedJson["kode_lokasi_vaksinasi"];
    this.name = parsedJson["nama_lokasi_vaksinasi"];
    this.fullAddress = parsedJson["alamat_lokasi_vaksinasi"];
    this.regencyName = parsedJson["wilayah"];
    this.district = parsedJson["kecamatan"];
    this.ward = parsedJson["kelurahan"];
    this.rt = parsedJson["rt"];
    this.rw = parsedJson["rw"];
    this.postalZip = parsedJson["kodepos"];
    this.faskesType = parsedJson["jenis_faskes"];
    this.vaccinatorTeamCount = parsedJson["jumlah_tim_vaksinator"];
    this.faskesName = parsedJson["nama_faskes"];
    this.isOpenForSecondDose = parsedJson["open_vaccine2"];
    this.isPcare = parsedJson["pcare"];

    List<VaccinationScheduleInfo> vaccinationScheduleInfos = [];
    for (dynamic data in parsedJson["jadwal"]) {
      vaccinationScheduleInfos.add(VaccinationScheduleInfo.fromJson(data));
    }
    this.schedule = vaccinationScheduleInfos;

    List<VaccinationLocationDetail> vaccinationLocationDetails = [];
    for (dynamic data in parsedJson["detail_lokasi"]) {
      vaccinationLocationDetails.add(VaccinationLocationDetail.fromJson(data));
    }
    this.locationDetails = vaccinationLocationDetails;
  }
}