part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const unknown404 = _Paths.unknown404;
  static const splash = _Paths.splash;
  static const login = _Paths.login;
  static const registration = login + _Paths.registration;
  static const home = _Paths.home;
  static const item = home + _Paths.item;
  static const addToCart = item + _Paths.addToCart;
  static const cart = _Paths.cart;


}

abstract class _Paths {
  static const unknown404 = '/404';
  static const splash = '/splash';
  static const login = '/login';
  static const registration = '/registration';
  static const home = '/home';
  static const item = '/item';
  static const addToCart = '/addToCart';
  static const cart = '/cart';

}