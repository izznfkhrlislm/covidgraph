class BedDetailInfo {
  DateTime? updatedTime;
  String? roomType;
  int? totalBed;
  int? availableBed;
  int? inQueue;

  BedDetailInfo({
    this.updatedTime,
    this.roomType,
    this.totalBed,
    this.availableBed,
    this.inQueue,
  });

  BedDetailInfo.fromJson(Map<String, dynamic> parsedJson) {
    this.updatedTime = parsedJson["updatedTime"];
    this.roomType = parsedJson["title"];
    this.totalBed = parsedJson["total"];
    this.availableBed = parsedJson["available"];
    this.inQueue = parsedJson["queue"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["updatedTime"] = this.updatedTime.toString();
    data["title"] = this.roomType;
    data["total"] = this.totalBed;
    data["available"] = this.availableBed;
    data["queue"] = this.inQueue;

    return data;
  }
}

class BedInfoList {
  List<BedDetailInfo>? bedDetails;

  BedInfoList({this.bedDetails});

  BedInfoList.fromJson(Map<String, dynamic> parsedJson) {
    List<BedDetailInfo> data = [];
    for (dynamic bedInfoData in parsedJson["bedDetails"]) {
      data.add(BedDetailInfo.fromJson(bedInfoData));
    }

    this.bedDetails = data;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["bedDetails"] = this.bedDetails;

    return data;
  }
}
