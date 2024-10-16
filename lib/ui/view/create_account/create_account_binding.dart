import 'package:dealse/ui/view/create_account/create_account_controller.dart';
import 'package:get/get.dart';


class CreateAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateAccountController>(
        () => CreateAccountController(authRepository: Get.find()));
  }
}
