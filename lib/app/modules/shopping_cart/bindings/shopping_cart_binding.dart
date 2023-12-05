import 'package:clothing_store_app/app/modules/shopping_cart/controllers/shopping_cart_controller.dart';
import 'package:get/get.dart';



class ShoppingCartBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShoppingCartController>(
      () => ShoppingCartController(),
    );
  }
}
