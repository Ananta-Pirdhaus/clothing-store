import 'package:get/get.dart';

import '../controllers/profilepage_controller.dart';

class ProfilepageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilepageController>(
      () => ProfilepageController(),
    );
  }
}
