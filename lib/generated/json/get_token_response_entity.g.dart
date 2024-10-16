import 'package:dealse/generated/json/base/json_convert_content.dart';
import 'package:dealse/data/model/get_token_response_entity.dart';

GetTokenResponseEntity $GetTokenResponseEntityFromJson(
    Map<String, dynamic> json) {
  final GetTokenResponseEntity getTokenResponseEntity = GetTokenResponseEntity();
  final GetTokenResponseData? data = jsonConvert.convert<GetTokenResponseData>(
      json['data']);
  if (data != null) {
    getTokenResponseEntity.data = data;
  }
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    getTokenResponseEntity.code = code;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    getTokenResponseEntity.message = message;
  }
  return getTokenResponseEntity;
}

Map<String, dynamic> $GetTokenResponseEntityToJson(
    GetTokenResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data.toJson();
  data['code'] = entity.code;
  data['message'] = entity.message;
  return data;
}

extension GetTokenResponseEntityExtension on GetTokenResponseEntity {
  GetTokenResponseEntity copyWith({
    GetTokenResponseData? data,
    int? code,
    String? message,
  }) {
    return GetTokenResponseEntity()
      ..data = data ?? this.data
      ..code = code ?? this.code
      ..message = message ?? this.message;
  }
}

GetTokenResponseData $GetTokenResponseDataFromJson(Map<String, dynamic> json) {
  final GetTokenResponseData getTokenResponseData = GetTokenResponseData();
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    getTokenResponseData.token = token;
  }
  return getTokenResponseData;
}

Map<String, dynamic> $GetTokenResponseDataToJson(GetTokenResponseData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['token'] = entity.token;
  return data;
}

extension GetTokenResponseDataExtension on GetTokenResponseData {
  GetTokenResponseData copyWith({
    String? token,
  }) {
    return GetTokenResponseData()
      ..token = token ?? this.token;
  }
}