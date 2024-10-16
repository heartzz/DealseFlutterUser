import 'package:dealse/generated/json/base/json_convert_content.dart';
import 'package:dealse/data/model/home_screen_response_entity.dart';

HomeScreenResponseEntity $HomeScreenResponseEntityFromJson(
    Map<String, dynamic> json) {
  final HomeScreenResponseEntity homeScreenResponseEntity = HomeScreenResponseEntity();
  final HomeScreenResponseData? data = jsonConvert.convert<
      HomeScreenResponseData>(json['data']);
  if (data != null) {
    homeScreenResponseEntity.data = data;
  }
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    homeScreenResponseEntity.code = code;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    homeScreenResponseEntity.message = message;
  }
  return homeScreenResponseEntity;
}

Map<String, dynamic> $HomeScreenResponseEntityToJson(
    HomeScreenResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.toJson();
  data['code'] = entity.code;
  data['message'] = entity.message;
  return data;
}

extension HomeScreenResponseEntityExtension on HomeScreenResponseEntity {
  HomeScreenResponseEntity copyWith({
    HomeScreenResponseData? data,
    int? code,
    String? message,
  }) {
    return HomeScreenResponseEntity()
      ..data = data ?? this.data
      ..code = code ?? this.code
      ..message = message ?? this.message;
  }
}

HomeScreenResponseData $HomeScreenResponseDataFromJson(
    Map<String, dynamic> json) {
  final HomeScreenResponseData homeScreenResponseData = HomeScreenResponseData();
  final List<HomeScreenResponseDataAreas>? areas = (json['areas'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<HomeScreenResponseDataAreas>(
          e) as HomeScreenResponseDataAreas).toList();
  if (areas != null) {
    homeScreenResponseData.areas = areas;
  }
  final HomeScreenResponseDataArea? area = jsonConvert.convert<
      HomeScreenResponseDataArea>(json['area']);
  if (area != null) {
    homeScreenResponseData.area = area;
  }
  final List<
      HomeScreenResponseDataStoreTypes>? storeTypes = (json['storeTypes'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<HomeScreenResponseDataStoreTypes>(
          e) as HomeScreenResponseDataStoreTypes).toList();
  if (storeTypes != null) {
    homeScreenResponseData.storeTypes = storeTypes;
  }
  final List<
      HomeScreenResponseDataUserNearByPlaces>? userNearByPlaces = (json['userNearByPlaces'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<HomeScreenResponseDataUserNearByPlaces>(
          e) as HomeScreenResponseDataUserNearByPlaces).toList();
  if (userNearByPlaces != null) {
    homeScreenResponseData.userNearByPlaces = userNearByPlaces;
  }
  final List<
      HomeScreenResponseDataLimitedTimeOffers>? limitedTimeOffers = (json['limitedTimeOffers'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<HomeScreenResponseDataLimitedTimeOffers>(
          e) as HomeScreenResponseDataLimitedTimeOffers).toList();
  if (limitedTimeOffers != null) {
    homeScreenResponseData.limitedTimeOffers = limitedTimeOffers;
  }
  return homeScreenResponseData;
}

Map<String, dynamic> $HomeScreenResponseDataToJson(
    HomeScreenResponseData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['areas'] = entity.areas?.map((v) => v.toJson()).toList();
  data['area'] = entity.area?.toJson();
  data['storeTypes'] = entity.storeTypes?.map((v) => v.toJson()).toList();
  data['userNearByPlaces'] =
      entity.userNearByPlaces?.map((v) => v.toJson()).toList();
  data['limitedTimeOffers'] =
      entity.limitedTimeOffers?.map((v) => v.toJson()).toList();
  return data;
}

extension HomeScreenResponseDataExtension on HomeScreenResponseData {
  HomeScreenResponseData copyWith({
    List<HomeScreenResponseDataAreas>? areas,
    HomeScreenResponseDataArea? area,
    List<HomeScreenResponseDataStoreTypes>? storeTypes,
    List<HomeScreenResponseDataUserNearByPlaces>? userNearByPlaces,
    List<HomeScreenResponseDataLimitedTimeOffers>? limitedTimeOffers,
  }) {
    return HomeScreenResponseData()
      ..areas = areas ?? this.areas
      ..area = area ?? this.area
      ..storeTypes = storeTypes ?? this.storeTypes
      ..userNearByPlaces = userNearByPlaces ?? this.userNearByPlaces
      ..limitedTimeOffers = limitedTimeOffers ?? this.limitedTimeOffers;
  }
}

HomeScreenResponseDataAreas $HomeScreenResponseDataAreasFromJson(
    Map<String, dynamic> json) {
  final HomeScreenResponseDataAreas homeScreenResponseDataAreas = HomeScreenResponseDataAreas();
  final int? areaId = jsonConvert.convert<int>(json['areaId']);
  if (areaId != null) {
    homeScreenResponseDataAreas.areaId = areaId;
  }
  final String? areaName = jsonConvert.convert<String>(json['areaName']);
  if (areaName != null) {
    homeScreenResponseDataAreas.areaName = areaName;
  }
  final double? latitude = jsonConvert.convert<double>(json['latitude']);
  if (latitude != null) {
    homeScreenResponseDataAreas.latitude = latitude;
  }
  final double? longitude = jsonConvert.convert<double>(json['longitude']);
  if (longitude != null) {
    homeScreenResponseDataAreas.longitude = longitude;
  }
  return homeScreenResponseDataAreas;
}

Map<String, dynamic> $HomeScreenResponseDataAreasToJson(
    HomeScreenResponseDataAreas entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['areaId'] = entity.areaId;
  data['areaName'] = entity.areaName;
  data['latitude'] = entity.latitude;
  data['longitude'] = entity.longitude;
  return data;
}

extension HomeScreenResponseDataAreasExtension on HomeScreenResponseDataAreas {
  HomeScreenResponseDataAreas copyWith({
    int? areaId,
    String? areaName,
    double? latitude,
    double? longitude,
  }) {
    return HomeScreenResponseDataAreas()
      ..areaId = areaId ?? this.areaId
      ..areaName = areaName ?? this.areaName
      ..latitude = latitude ?? this.latitude
      ..longitude = longitude ?? this.longitude;
  }
}

HomeScreenResponseDataArea $HomeScreenResponseDataAreaFromJson(
    Map<String, dynamic> json) {
  final HomeScreenResponseDataArea homeScreenResponseDataArea = HomeScreenResponseDataArea();
  final int? areaId = jsonConvert.convert<int>(json['areaId']);
  if (areaId != null) {
    homeScreenResponseDataArea.areaId = areaId;
  }
  final String? areaName = jsonConvert.convert<String>(json['areaName']);
  if (areaName != null) {
    homeScreenResponseDataArea.areaName = areaName;
  }
  final double? latitude = jsonConvert.convert<double>(json['latitude']);
  if (latitude != null) {
    homeScreenResponseDataArea.latitude = latitude;
  }
  final double? longitude = jsonConvert.convert<double>(json['longitude']);
  if (longitude != null) {
    homeScreenResponseDataArea.longitude = longitude;
  }
  return homeScreenResponseDataArea;
}

Map<String, dynamic> $HomeScreenResponseDataAreaToJson(
    HomeScreenResponseDataArea entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['areaId'] = entity.areaId;
  data['areaName'] = entity.areaName;
  data['latitude'] = entity.latitude;
  data['longitude'] = entity.longitude;
  return data;
}

extension HomeScreenResponseDataAreaExtension on HomeScreenResponseDataArea {
  HomeScreenResponseDataArea copyWith({
    int? areaId,
    String? areaName,
    double? latitude,
    double? longitude,
  }) {
    return HomeScreenResponseDataArea()
      ..areaId = areaId ?? this.areaId
      ..areaName = areaName ?? this.areaName
      ..latitude = latitude ?? this.latitude
      ..longitude = longitude ?? this.longitude;
  }
}

HomeScreenResponseDataStoreTypes $HomeScreenResponseDataStoreTypesFromJson(
    Map<String, dynamic> json) {
  final HomeScreenResponseDataStoreTypes homeScreenResponseDataStoreTypes = HomeScreenResponseDataStoreTypes();
  final int? storeTypeId = jsonConvert.convert<int>(json['storeTypeId']);
  if (storeTypeId != null) {
    homeScreenResponseDataStoreTypes.storeTypeId = storeTypeId;
  }
  final String? storeTypeName = jsonConvert.convert<String>(
      json['storeTypeName']);
  if (storeTypeName != null) {
    homeScreenResponseDataStoreTypes.storeTypeName = storeTypeName;
  }
  final String? storeTypeImage = jsonConvert.convert<String>(
      json['storeTypeImage']);
  if (storeTypeImage != null) {
    homeScreenResponseDataStoreTypes.storeTypeImage = storeTypeImage;
  }
  return homeScreenResponseDataStoreTypes;
}

Map<String, dynamic> $HomeScreenResponseDataStoreTypesToJson(
    HomeScreenResponseDataStoreTypes entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['storeTypeId'] = entity.storeTypeId;
  data['storeTypeName'] = entity.storeTypeName;
  data['storeTypeImage'] = entity.storeTypeImage;
  return data;
}

extension HomeScreenResponseDataStoreTypesExtension on HomeScreenResponseDataStoreTypes {
  HomeScreenResponseDataStoreTypes copyWith({
    int? storeTypeId,
    String? storeTypeName,
    String? storeTypeImage,
  }) {
    return HomeScreenResponseDataStoreTypes()
      ..storeTypeId = storeTypeId ?? this.storeTypeId
      ..storeTypeName = storeTypeName ?? this.storeTypeName
      ..storeTypeImage = storeTypeImage ?? this.storeTypeImage;
  }
}

HomeScreenResponseDataUserNearByPlaces $HomeScreenResponseDataUserNearByPlacesFromJson(
    Map<String, dynamic> json) {
  final HomeScreenResponseDataUserNearByPlaces homeScreenResponseDataUserNearByPlaces = HomeScreenResponseDataUserNearByPlaces();
  final int? offerID = jsonConvert.convert<int>(json['offerID']);
  if (offerID != null) {
    homeScreenResponseDataUserNearByPlaces.offerID = offerID;
  }
  final String? offerName = jsonConvert.convert<String>(json['offerName']);
  if (offerName != null) {
    homeScreenResponseDataUserNearByPlaces.offerName = offerName;
  }
  final String? offerListingImage = jsonConvert.convert<String>(
      json['offerListingImage']);
  if (offerListingImage != null) {
    homeScreenResponseDataUserNearByPlaces.offerListingImage =
        offerListingImage;
  }
  final String? storeName = jsonConvert.convert<String>(json['storeName']);
  if (storeName != null) {
    homeScreenResponseDataUserNearByPlaces.storeName = storeName;
  }
  final String? areaName = jsonConvert.convert<String>(json['areaName']);
  if (areaName != null) {
    homeScreenResponseDataUserNearByPlaces.areaName = areaName;
  }
  final String? offerShortDescription = jsonConvert.convert<String>(
      json['offerShortDescription']);
  if (offerShortDescription != null) {
    homeScreenResponseDataUserNearByPlaces.offerShortDescription =
        offerShortDescription;
  }
  final String? offerLongDescription = jsonConvert.convert<String>(
      json['offerLongDescription']);
  if (offerLongDescription != null) {
    homeScreenResponseDataUserNearByPlaces.offerLongDescription =
        offerLongDescription;
  }
  return homeScreenResponseDataUserNearByPlaces;
}

Map<String, dynamic> $HomeScreenResponseDataUserNearByPlacesToJson(
    HomeScreenResponseDataUserNearByPlaces entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['offerID'] = entity.offerID;
  data['offerName'] = entity.offerName;
  data['offerListingImage'] = entity.offerListingImage;
  data['storeName'] = entity.storeName;
  data['areaName'] = entity.areaName;
  data['offerShortDescription'] = entity.offerShortDescription;
  data['offerLongDescription'] = entity.offerLongDescription;
  return data;
}

extension HomeScreenResponseDataUserNearByPlacesExtension on HomeScreenResponseDataUserNearByPlaces {
  HomeScreenResponseDataUserNearByPlaces copyWith({
    int? offerID,
    String? offerName,
    String? offerListingImage,
    String? storeName,
    String? areaName,
    String? offerShortDescription,
    String? offerLongDescription,
  }) {
    return HomeScreenResponseDataUserNearByPlaces()
      ..offerID = offerID ?? this.offerID
      ..offerName = offerName ?? this.offerName
      ..offerListingImage = offerListingImage ?? this.offerListingImage
      ..storeName = storeName ?? this.storeName
      ..areaName = areaName ?? this.areaName
      ..offerShortDescription = offerShortDescription ??
          this.offerShortDescription
      ..offerLongDescription = offerLongDescription ??
          this.offerLongDescription;
  }
}

HomeScreenResponseDataLimitedTimeOffers $HomeScreenResponseDataLimitedTimeOffersFromJson(
    Map<String, dynamic> json) {
  final HomeScreenResponseDataLimitedTimeOffers homeScreenResponseDataLimitedTimeOffers = HomeScreenResponseDataLimitedTimeOffers();
  final int? offerID = jsonConvert.convert<int>(json['offerID']);
  if (offerID != null) {
    homeScreenResponseDataLimitedTimeOffers.offerID = offerID;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    homeScreenResponseDataLimitedTimeOffers.title = title;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    homeScreenResponseDataLimitedTimeOffers.image = image;
  }
  final String? storeName = jsonConvert.convert<String>(json['storeName']);
  if (storeName != null) {
    homeScreenResponseDataLimitedTimeOffers.storeName = storeName;
  }
  final String? areaName = jsonConvert.convert<String>(json['areaName']);
  if (areaName != null) {
    homeScreenResponseDataLimitedTimeOffers.areaName = areaName;
  }
  final String? shortDescription = jsonConvert.convert<String>(
      json['shortDescription']);
  if (shortDescription != null) {
    homeScreenResponseDataLimitedTimeOffers.shortDescription = shortDescription;
  }
  final String? offerNote = jsonConvert.convert<String>(json['offerNote']);
  if (offerNote != null) {
    homeScreenResponseDataLimitedTimeOffers.offerNote = offerNote;
  }
  return homeScreenResponseDataLimitedTimeOffers;
}

Map<String, dynamic> $HomeScreenResponseDataLimitedTimeOffersToJson(
    HomeScreenResponseDataLimitedTimeOffers entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['offerID'] = entity.offerID;
  data['title'] = entity.title;
  data['image'] = entity.image;
  data['storeName'] = entity.storeName;
  data['areaName'] = entity.areaName;
  data['shortDescription'] = entity.shortDescription;
  data['offerNote'] = entity.offerNote;
  return data;
}

extension HomeScreenResponseDataLimitedTimeOffersExtension on HomeScreenResponseDataLimitedTimeOffers {
  HomeScreenResponseDataLimitedTimeOffers copyWith({
    int? offerID,
    String? title,
    String? image,
    String? storeName,
    String? areaName,
    String? shortDescription,
    String? offerNote,
  }) {
    return HomeScreenResponseDataLimitedTimeOffers()
      ..offerID = offerID ?? this.offerID
      ..title = title ?? this.title
      ..image = image ?? this.image
      ..storeName = storeName ?? this.storeName
      ..areaName = areaName ?? this.areaName
      ..shortDescription = shortDescription ?? this.shortDescription
      ..offerNote = offerNote ?? this.offerNote;
  }
}