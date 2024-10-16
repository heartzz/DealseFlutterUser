import 'package:dealse/ui/view/user_dashboard/user_home_controller.dart';
import 'package:get/get.dart';

class UserHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserHomeController>(
        () => UserHomeController(authRepository: Get.find()));
  }
}
