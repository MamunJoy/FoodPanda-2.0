
import 'package:foodpanda_clone/Controller/add_to_card_controller.dart';
import 'package:foodpanda_clone/Controller/card_controller.dart';
import 'package:foodpanda_clone/Controller/home_controller.dart';
import 'package:foodpanda_clone/Controller/item_controller.dart';
import 'package:foodpanda_clone/Controller/login_controller.dart';
import 'package:foodpanda_clone/Controller/registration_controller.dart';
import 'package:foodpanda_clone/View/Screens/add_to_card_screen.dart';
import 'package:foodpanda_clone/View/Screens/card_screen.dart';
import 'package:foodpanda_clone/View/Screens/home_screen.dart';
import 'package:foodpanda_clone/View/Screens/item_screen.dart';
import 'package:foodpanda_clone/View/Screens/login_screen.dart';
import 'package:foodpanda_clone/View/Screens/registration_screen.dart';
import 'package:foodpanda_clone/View/Screens/splash_screen.dart';
import 'package:foodpanda_clone/View/Screens/unknow_route_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static final unknownRoute = GetPage(
    name: _Paths.unknown404,
    page: () => const Unknown404Screen(),
  );
  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginScreen(),
      binding: BindingsBuilder(
            () => Get.lazyPut<LoginController>(() => LoginController()),
      ),
      children: [
        GetPage(
          name: _Paths.registration,
          page: () => const RegistrationScreen(),
          binding: BindingsBuilder(
                () => Get.lazyPut<RegistrationController>(() => RegistrationController()),
          ),
        )
      ]
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeScreen(),
      binding: BindingsBuilder(
            () => Get.lazyPut<HomeController>(() => HomeController()),
      ),
      children: [
        GetPage(
          name: _Paths.item,
          page: () => const ItemScreen(),
          binding: BindingsBuilder(
                () => Get.lazyPut<ItemController>(() => ItemController()),
          ),
          children: [
            GetPage(
              name: _Paths.addToCart,
              page: () => AddToCardScreen(),
              binding: BindingsBuilder(
                    () => Get.lazyPut<AddToCardController>(() => AddToCardController()),
              ),
            ),
            GetPage(
              name: _Paths.cart,
              page: () => CardScreen(),
              binding: BindingsBuilder(
                    () => Get.lazyPut<CardController>(() => CardController()),
              ),
            ),
          ]
        ),
      ],
    ),
  ];
}

class BindingsX {
  static BindingsBuilder initialBindigs() {
    return BindingsBuilder(() {
      // Get.lazyPut<APIRepository>(() => APIRepository(), fenix: true);
      // Get.lazyPut<APICall>(() => APICall(), fenix: true);
    });
  }
}