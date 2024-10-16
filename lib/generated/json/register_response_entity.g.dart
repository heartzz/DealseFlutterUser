import 'package:dealse/generated/json/base/json_convert_content.dart';
import 'package:dealse/data/model/register_response_entity.dart';

RegisterResponseEntity $RegisterResponseEntityFromJson(
    Map<String, dynamic> json) {
  final RegisterResponseEntity registerResponseEntity = RegisterResponseEntity();
  final RegisterResponseData? data = jsonConvert.convert<RegisterResponseData>(
      json['data']);
  if (data != null) {
    registerResponseEntity.data = data;
  }
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    registerResponseEntity.code = code;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    registerResponseEntity.message = message;
  }
  return registerResponseEntity;
}

Map<String, dynamic> $RegisterResponseEntityToJson(
    RegisterResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data.toJson();
  data['code'] = entity.code;
  data['message'] = entity.message;
  return data;
}

extension RegisterResponseEntityExtension on RegisterResponseEntity {
  RegisterResponseEntity copyWith({
    RegisterResponseData? data,
    int? code,
    String? message,
  }) {
    return RegisterResponseEntity()
      ..data = data ?? this.data
      ..code = code ?? this.code
      ..message = message ?? this.message;
  }
}

RegisterResponseData $RegisterResponseDataFromJson(Map<String, dynamic> json) {
  final RegisterResponseData registerResponseData = RegisterResponseData();
  final int? userID = jsonConvert.convert<int>(json['userID']);
  if (userID != null) {
    registerResponseData.userID = userID;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    registerResponseData.name = name;
  }
  final String? mobileNo = jsonConvert.convert<String>(json['mobileNo']);
  if (mobileNo != null) {
    registerResponseData.mobileNo = mobileNo;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    registerResponseData.email = email;
  }
  final String? facebookId = jsonConvert.convert<String>(json['facebookId']);
  if (facebookId != null) {
    registerResponseData.facebookId = facebookId;
  }
  final dynamic googlePlusId = json['googlePlusId'];
  if (googlePlusId != null) {
    registerResponseData.googlePlusId = googlePlusId;
  }
  final int? registrationType = jsonConvert.convert<int>(
      json['registrationType']);
  if (registrationType != null) {
    registerResponseData.registrationType = registrationType;
  }
  final String? deviceID = jsonConvert.convert<String>(json['deviceID']);
  if (deviceID != null) {
    registerResponseData.deviceID = deviceID;
  }
  final String? deviceType = jsonConvert.convert<String>(json['deviceType']);
  if (deviceType != null) {
    registerResponseData.deviceType = deviceType;
  }
  final dynamic gender = json['gender'];
  if (gender != null) {
    registerResponseData.gender = gender;
  }
  final dynamic maritalStatus = json['maritalStatus'];
  if (maritalStatus != null) {
    registerResponseData.maritalStatus = maritalStatus;
  }
  final dynamic dob = json['dob'];
  if (dob != null) {
    registerResponseData.dob = dob;
  }
  final dynamic address1 = json['address1'];
  if (address1 != null) {
    registerResponseData.address1 = address1;
  }
  final dynamic address2 = json['address2'];
  if (address2 != null) {
    registerResponseData.address2 = address2;
  }
  final dynamic address3 = json['address3'];
  if (address3 != null) {
    registerResponseData.address3 = address3;
  }
  final String? photo = jsonConvert.convert<String>(json['photo']);
  if (photo != null) {
    registerResponseData.photo = photo;
  }
  return registerResponseData;
}

Map<String, dynamic> $RegisterResponseDataToJson(RegisterResponseData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['userID'] = entity.userID;
  data['name'] = entity.name;
  data['mobileNo'] = entity.mobileNo;
  data['email'] = entity.email;
  data['facebookId'] = entity.facebookId;
  data['googlePlusId'] = entity.googlePlusId;
  data['registrationType'] = entity.registrationType;
  data['deviceID'] = entity.deviceID;
  data['deviceType'] = entity.deviceType;
  data['gender'] = entity.gender;
  data['maritalStatus'] = entity.maritalStatus;
  data['dob'] = entity.dob;
  data['address1'] = entity.address1;
  data['address2'] = entity.address2;
  data['address3'] = entity.address3;
  data['photo'] = entity.photo;
  return data;
}

extension RegisterResponseDataExtension on RegisterResponseData {
  RegisterResponseData copyWith({
    int? userID,
    String? name,
    String? mobileNo,
    String? email,
    String? facebookId,
    dynamic googlePlusId,
    int? registrationType,
    String? deviceID,
    String? deviceType,
    dynamic gender,
    dynamic maritalStatus,
    dynamic dob,
    dynamic address1,
    dynamic address2,
    dynamic address3,
    String? photo,
  }) {
    return RegisterResponseData()
      ..userID = userID ?? this.userID
      ..name = name ?? this.name
      ..mobileNo = mobileNo ?? this.mobileNo
      ..email = email ?? this.email
      ..facebookId = facebookId ?? this.facebookId
      ..googlePlusId = googlePlusId ?? this.googlePlusId
      ..registrationType = registrationType ?? this.registrationType
      ..deviceID = deviceID ?? this.deviceID
      ..deviceType = deviceType ?? this.deviceType
      ..gender = gender ?? this.gender
      ..maritalStatus = maritalStatus ?? this.maritalStatus
      ..dob = dob ?? this.dob
      ..address1 = address1 ?? this.address1
      ..address2 = address2 ?? this.address2
      ..address3 = address3 ?? this.address3
      ..photo = photo ?? this.photo;
  }
}