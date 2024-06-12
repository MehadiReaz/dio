import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:smart_hrm/views/home/home_page_copy.dart';

import '../../views/getstarted/get_started_screen.dart';
import '../../views/splash/splash_screen.dart';

class AppRoute {
  static const String initialscreen = "/";
  // static const String loginscreen = "/login_screen";e
  static const String homescreen = "/home_screen";
  static const String registerscreen = "/register_screen";
  static const String getstartedscreen = "/getstarted_screen";

  static List<GetPage> route = [
    GetPage(
        name: initialscreen,
        page: () => const SplashScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: getstartedscreen,
        page: () => const GetStartedScreen(),
        transition: Transition.fadeIn),
    // GetPage(name: registerscreen, page: () => const RegisterScreen()),
    // GetPage(name: loginscreen, page: () => const LoginScreen()),
    GetPage(name: homescreen, page: () => const HomeScreenCopy()),
  ];
}
