
import 'package:dealse/ui/view/splash/token_binding.dart';
import 'package:dealse/ui/view/create_account/create_account_screen.dart';
import 'package:dealse/ui/view/introduction/introduction_screen.dart';
import 'package:dealse/ui/view/login/login_binding.dart';
import 'package:dealse/ui/view/login/login_screen.dart';
import 'package:dealse/ui/view/otp/otp_screen.dart';
import 'package:dealse/ui/view/user_dashboard/user_dashboard_screen.dart';
import 'package:dealse/ui/view/user_dashboard/user_home_binding.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../ui/view/create_account/create_account_binding.dart';
import '../ui/view/offer_details/offer_details_screen.dart';
import '../ui/view/profile/edit_profile_screen.dart';
import '../ui/view/splash/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
      binding: TokenBinding(),
    ),
    GetPage(
      name: Routes.introduction,
      page: () => const IntroductionScreen(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.createAccount,
      page: () => const CreateAccountScreen(),
      binding: CreateAccountBinding(),
    ),
    GetPage(
      name: Routes.otp,
      page: () => const OtpScreen(),
    ),
    GetPage(
      name: Routes.userDashboard,
      page: () => const UserDashboardScreen(),
      binding: UserHomeBinding(),
    ),
    GetPage(
      name: Routes.offerDetails,
      page: () => const OfferDetailsScreen(),
    ),
    GetPage(
      name: Routes.editProfile,
      page: () => const EditProfileScreen(),
    ),

  ];
}
