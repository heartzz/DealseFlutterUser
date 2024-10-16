import 'package:dealse/data/model/home_screen_response_entity.dart';
import 'package:dealse/repositories/token_repository.dart';
import 'package:dealse/utils/app_string.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../../utils/utility.dart';


class UserHomeController extends GetxController {
  final TokenRepository authRepository;
  UserHomeController({required this.authRepository});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Rx<HomeScreenResponseDataArea> area =  HomeScreenResponseDataArea().obs;
  RxList<HomeScreenResponseDataAreas> areasListing = <HomeScreenResponseDataAreas>[].obs;
  RxList<HomeScreenResponseDataStoreTypes> storeListing = <HomeScreenResponseDataStoreTypes>[].obs;
  RxList<HomeScreenResponseDataUserNearByPlaces> nearPlacesListing = <HomeScreenResponseDataUserNearByPlaces>[].obs;
  RxList<HomeScreenResponseDataLimitedTimeOffers> limitedListing = <HomeScreenResponseDataLimitedTimeOffers>[].obs;

  RxInt storeTypeId=0.obs;
  RxDouble userLatitude=0.0.obs;
  RxDouble userLongitude=0.0.obs;


  Future<void> getUserHomeScreenDetailsForUserApp(int storeTypeId,double userLatitude,double userLongitude) async {

      Utility.showLoading();
      if (await InternetConnection().hasInternetAccess) {
        try {
          Map<String, dynamic> params = {
            "storeTypeId": storeTypeId,
            "userLatitude": userLatitude,
            "userLongitude": userLongitude,

          };
          Response response = await authRepository.getUserHomeScreenDetailsForUserApp(params: params);
          Utility.hideLoading();
          if (response.statusCode == 200) {
            HomeScreenResponseEntity responseEntity = HomeScreenResponseEntity.fromJson(response.data);
            areasListing.value=addAreas(responseEntity.data?.areas ?? [],userLatitude,userLongitude);
            storeListing.value = responseEntity.data?.storeTypes ?? [];
            nearPlacesListing.value = responseEntity.data?.userNearByPlaces ?? [];
            limitedListing.value = responseEntity.data?.limitedTimeOffers ?? [];
            if(responseEntity.data!.area!.areaName==null){
              area.value=HomeScreenResponseDataArea();
            }else{
              area.value = responseEntity.data!.area!;
            }
          } else {
            Utility.showToastMessage(response.data);
          }
        } catch (e) {
          print('Error occured: $e');
          Utility.hideLoading();
          // Utility.showToastMessage(AppStrings.commonErrorMessage);
        }
      } else {
        Utility.hideLoading();
        Utility.showToastMessage(AppStrings.internetConnectionError);
      }
    }


  List<HomeScreenResponseDataAreas> addAreas(List<HomeScreenResponseDataAreas> areaList, double currentLatitude, double currentLongitude) {
    bool isCurrentLocationMatched = false;

    // Create an area object for the current location
    HomeScreenResponseDataAreas areaCurrent = HomeScreenResponseDataAreas();
    areaCurrent.areaName = 'Current Location';

    // Check if the current location matches any area in the list
    for (var area in areaList) {
      if (area.latitude == currentLatitude && area.longitude == currentLongitude) {
        isCurrentLocationMatched = true;
        break;  // No need to continue checking once a match is found
      }
    }

    // If no match, add the current location area at the beginning of the list
    if (!isCurrentLocationMatched) {
      areaList.insert(0, areaCurrent);  // Insert at the beginning
    }

    // Return the updated list of areas
    return areaList;
  }

}
