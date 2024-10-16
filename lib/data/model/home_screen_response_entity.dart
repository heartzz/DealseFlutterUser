import 'package:dealse/generated/json/base/json_field.dart';
import 'package:dealse/generated/json/home_screen_response_entity.g.dart';
import 'dart:convert';
export 'package:dealse/generated/json/home_screen_response_entity.g.dart';

@JsonSerializable()
class HomeScreenResponseEntity {
	HomeScreenResponseData? data;
	int? code = 0;
	String? message = '';

	HomeScreenResponseEntity();

	factory HomeScreenResponseEntity.fromJson(Map<String, dynamic> json) => $HomeScreenResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $HomeScreenResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeScreenResponseData {
	List<HomeScreenResponseDataAreas>? areas = [];
	HomeScreenResponseDataArea? area;
	List<HomeScreenResponseDataStoreTypes>? storeTypes = [];
	List<HomeScreenResponseDataUserNearByPlaces>? userNearByPlaces = [];
	List<HomeScreenResponseDataLimitedTimeOffers>? limitedTimeOffers = [];

	HomeScreenResponseData();

	factory HomeScreenResponseData.fromJson(Map<String, dynamic> json) => $HomeScreenResponseDataFromJson(json);

	Map<String, dynamic> toJson() => $HomeScreenResponseDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeScreenResponseDataAreas {
	int? areaId = 0;
	String? areaName = '';
	double? latitude;
	double? longitude;

	HomeScreenResponseDataAreas();

	factory HomeScreenResponseDataAreas.fromJson(Map<String, dynamic> json) => $HomeScreenResponseDataAreasFromJson(json);

	Map<String, dynamic> toJson() => $HomeScreenResponseDataAreasToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeScreenResponseDataArea {
	int? areaId = 0;
	String? areaName = '';
	double? latitude;
	double? longitude;

	HomeScreenResponseDataArea();

	factory HomeScreenResponseDataArea.fromJson(Map<String, dynamic> json) => $HomeScreenResponseDataAreaFromJson(json);

	Map<String, dynamic> toJson() => $HomeScreenResponseDataAreaToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeScreenResponseDataStoreTypes {
	int? storeTypeId = 0;
	String? storeTypeName = '';
	String? storeTypeImage = '';

	HomeScreenResponseDataStoreTypes();

	factory HomeScreenResponseDataStoreTypes.fromJson(Map<String, dynamic> json) => $HomeScreenResponseDataStoreTypesFromJson(json);

	Map<String, dynamic> toJson() => $HomeScreenResponseDataStoreTypesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeScreenResponseDataUserNearByPlaces {
	int? offerID = 0;
	String? offerName = '';
	String? offerListingImage = '';
	String? storeName = '';
	String? areaName = '';
	String? offerShortDescription = '';
	String? offerLongDescription = '';

	HomeScreenResponseDataUserNearByPlaces();

	factory HomeScreenResponseDataUserNearByPlaces.fromJson(Map<String, dynamic> json) => $HomeScreenResponseDataUserNearByPlacesFromJson(json);

	Map<String, dynamic> toJson() => $HomeScreenResponseDataUserNearByPlacesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HomeScreenResponseDataLimitedTimeOffers {
	int? offerID = 0;
	String? title = '';
	String? image = '';
	String? storeName = '';
	String? areaName = '';
	String? shortDescription = '';
	String? offerNote = '';

	HomeScreenResponseDataLimitedTimeOffers();

	factory HomeScreenResponseDataLimitedTimeOffers.fromJson(Map<String, dynamic> json) => $HomeScreenResponseDataLimitedTimeOffersFromJson(json);

	Map<String, dynamic> toJson() => $HomeScreenResponseDataLimitedTimeOffersToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}