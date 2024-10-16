import 'package:dealse/data/constants.dart';
import 'package:dealse/data/model/get_token_response_entity.dart';
import 'package:dealse/utils/app_string.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../../repositories/token_repository.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/utility.dart';


class TokenController extends GetxController {
  final TokenRepository tokenRepository;

  TokenController({required this.tokenRepository});



  Future<void> getAuthenticateToken() async {
    Utility.showLoading();
      if (await InternetConnection().hasInternetAccess) {
        try {
          Map<String, dynamic> params = {
            "clientSecret": Constants.clientSecret,
          };
          Response response = await tokenRepository.getToken(params: params);
          Utility.hideLoading();
          if (response.statusCode == 200) {
            GetTokenResponseEntity responseModel =
            GetTokenResponseEntity.fromJson(response.data);
            await GetStorage()
                .write(Constants.accessToken, responseModel.data.token);

            Utility.showToastMessage(responseModel.data.token);
            Get.offAllNamed(Routes.login);
          } else {
            Utility.showToastMessage(response.data);
          }
        } catch (e) {
          print('Error occured: $e');
          Utility.hideLoading();
          Utility.showToastMessage(AppStrings.commonErrorMessage);
        }
      }
    }
  }



