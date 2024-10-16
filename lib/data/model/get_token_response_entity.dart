import 'package:dealse/generated/json/base/json_field.dart';
import 'package:dealse/generated/json/get_token_response_entity.g.dart';
import 'dart:convert';
export 'package:dealse/generated/json/get_token_response_entity.g.dart';

@JsonSerializable()
class GetTokenResponseEntity {
	late GetTokenResponseData data;
	late int code = 0;
	late String message = '';

	GetTokenResponseEntity();

	factory GetTokenResponseEntity.fromJson(Map<String, dynamic> json) => $GetTokenResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $GetTokenResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class GetTokenResponseData {
	late String token = '';

	GetTokenResponseData();

	factory GetTokenResponseData.fromJson(Map<String, dynamic> json) => $GetTokenResponseDataFromJson(json);

	Map<String, dynamic> toJson() => $GetTokenResponseDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}