class ForceUpdateConfigModel {
  ForceUpdate? forceUpdate;
  UnderMaintainance? underMaintenance;

  ForceUpdateConfigModel({this.forceUpdate, this.underMaintenance});

  ForceUpdateConfigModel.fromJson(Map<String, dynamic> json) {
    forceUpdate = json['force_update'] != null
        ? ForceUpdate.fromJson(json['force_update'])
        : null;
    underMaintenance = json['under_maintainance'] != null
        ? UnderMaintainance.fromJson(json['under_maintainance'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (forceUpdate != null) {
      data['force_update'] = forceUpdate!.toJson();
    }
    if (underMaintenance != null) {
      data['under_maintainance'] = underMaintenance!.toJson();
    }
    return data;
  }
}

class ForceUpdate {
  String? androidMaxVersion;
  String? androidMinVersion;
  String? iosMaxVersion;
  String? iosMinVersion;
  String? forceUpdateMsg;

  ForceUpdate(
      {this.androidMaxVersion,
        this.androidMinVersion,
        this.iosMaxVersion,
        this.iosMinVersion,
        this.forceUpdateMsg});

  ForceUpdate.fromJson(Map<String, dynamic> json) {
    androidMaxVersion = json['android_max_version'];
    androidMinVersion = json['android_min_version'];
    iosMaxVersion = json['ios_max_version'];
    iosMinVersion = json['ios_min_version'];
    forceUpdateMsg = json['force_update_msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['android_max_version'] = androidMaxVersion;
    data['android_min_version'] = androidMinVersion;
    data['ios_max_version'] = iosMaxVersion;
    data['ios_min_version'] = iosMinVersion;
    data['force_update_msg'] = forceUpdateMsg;
    return data;
  }
}

class UnderMaintainance {
  bool? isMaintainanceModeEnable;
  String? maintainanceTitle;
  String? maintainanceDescription;
  String? maintainanceImage;
  int? maintainancePriority;

  UnderMaintainance(
      {this.isMaintainanceModeEnable,
        this.maintainanceTitle,
        this.maintainanceDescription,
        this.maintainanceImage,
        this.maintainancePriority});

  UnderMaintainance.fromJson(Map<String, dynamic> json) {
    isMaintainanceModeEnable = json['is_maintainance_mode_enable'];
    maintainanceTitle = json['maintainance_title'];
    maintainanceDescription = json['maintainance_description'];
    maintainanceImage = json['maintainance_image'];
    maintainancePriority = json['maintainance_priority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_maintainance_mode_enable'] = isMaintainanceModeEnable;
    data['maintainance_title'] = maintainanceTitle;
    data['maintainance_description'] = maintainanceDescription;
    data['maintainance_image'] = maintainanceImage;
    data['maintainance_priority'] = maintainancePriority;
    return data;
  }
}