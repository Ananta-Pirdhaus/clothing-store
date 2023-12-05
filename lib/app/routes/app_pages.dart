
import 'package:clothing_store_app/app/modules/shopping_cart/bindings/shopping_cart_binding.dart';
import 'package:clothing_store_app/app/modules/shopping_cart/views/shopping_cart_views.dart';
import 'package:get/get.dart';
import '../modules/product_api/views/product.dart';
import '../modules/register/bindings/login_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/register/views/login_view.dart';
import '../modules/homepage/bindings/homepage_binding.dart';
import '../modules/homepage/views/homepage_view.dart';
import '../modules/profilepage/bindings/profilepage_binding.dart';
import '../modules/profilepage/views/profilepage_view.dart';
import '../modules/product_api/bindings/api_service_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.REGISTER;

  static final routes = [
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.HOMEPAGE,
      page: () => HomePage(),
      binding: HomepageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILEPAGE,
      page: () => ProfilepageView(),
      binding: ProfilepageBinding(),
    ),
    GetPage(
      name: _Paths.SHOPPINGCART,
      page: () => ShoppingCartView(),
      binding: ShoppingCartBindings(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => Product(),
      binding: ProductBinding(),
    ),
  ];
}
