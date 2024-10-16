import 'package:get/get.dart';

import '../data/api/dio_client.dart';
import '../data/constants.dart';


class TokenRepository extends GetxService {
  DioClient dioClient = Get.find();

  Future<dynamic> login({required Map<String, dynamic> params}) async {
    return await dioClient.post(Constants.login, params: params);
  }

  Future<dynamic> getToken({required Map<String, dynamic> params}) async {
    return await dioClient.post(Constants.getToken, params: params);
  }
  Future<dynamic> addUserForUserApp({required Map<String, dynamic> params}) async {
    return await dioClient.post(Constants.addUserForUserApp, params: params);
  }
  Future<dynamic> getUserHomeScreenDetailsForUserApp({required Map<String, dynamic> params}) async {
    return await dioClient.get(Constants.getUserHomeScreenDetailsForUserApp, params: params);
  }


}
