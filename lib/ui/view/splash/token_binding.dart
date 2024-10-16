import 'package:dealse/repositories/token_repository.dart';
import 'package:dealse/ui/view/splash/token_controller.dart';
import 'package:get/get.dart';

class TokenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TokenRepository(), permanent: true);

    Get.lazyPut<TokenController>(
        () => TokenController(tokenRepository: Get.find()));
  }
}
