import 'package:get/get.dart';
// import '../../../widget/accountController.dart';
import '../controllers/register.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController(),);
    // Get.lazyPut<AccountController>(() => AccountController(),);
  }
}
