import 'package:dealse/generated/json/base/json_field.dart';
import 'package:dealse/generated/json/register_response_entity.g.dart';
import 'dart:convert';
export 'package:dealse/generated/json/register_response_entity.g.dart';

@JsonSerializable()
class RegisterResponseEntity {
	late RegisterResponseData data;
	late int code = 0;
	late String message = '';

	RegisterResponseEntity();

	factory RegisterResponseEntity.fromJson(Map<String, dynamic> json) => $RegisterResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $RegisterResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class RegisterResponseData {
	late int userID = 0;
	late String name = '';
	late String mobileNo = '';
	late String email = '';
	late String facebookId = '';
	dynamic googlePlusId;
	late int registrationType = 0;
	late String deviceID = '';
	late String deviceType = '';
	dynamic gender;
	dynamic maritalStatus;
	dynamic dob;
	dynamic address1;
	dynamic address2;
	dynamic address3;
	late String photo = '';

	RegisterResponseData();

	factory RegisterResponseData.fromJson(Map<String, dynamic> json) => $RegisterResponseDataFromJson(json);

	Map<String, dynamic> toJson() => $RegisterResponseDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}