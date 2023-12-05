import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfilepageController extends GetxController {
  ImagePicker imagePicker = ImagePicker();

  XFile? pickedImage = null;
  Uint8List? upIm = null;

  void resetImage() {
    pickedImage = null;
    upIm = null;
    update();
  }

  void selectImage(ImageSource source) async {
    try {
      final checkDataImage = await imagePicker.pickImage(source: source);
      if (checkDataImage != null) {
        pickedImage = checkDataImage;
        final Uint8List? imgBytes = await checkDataImage.readAsBytes();
        if (imgBytes != null) {
          upIm = imgBytes;
        }
      }
      update();
    } catch (err) {
      print(err);
      pickedImage = null;
      upIm = null;
      update();
    }
  }

  void updateAvatar() {
    update();
  }

  Uint8List? get imageBytes => upIm;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void updateProfileImage(String imagePath) {}
}
