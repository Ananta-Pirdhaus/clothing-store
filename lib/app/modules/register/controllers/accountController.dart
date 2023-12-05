import 'package:appwrite/appwrite.dart';
// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../widget/clientController.dart';

class AccountController extends ClientController {
  Account? account;

  @override
  void onInit() {
    super.onInit();
    // appwrite\\\
    account = Account(client);
  }

  Future createAccount(Map map) async {
    try {
      if (account != null) {
        final result = await account!.create(
          userId: map['userId'],
          email: map['email'],
          password: map['password'],
          name: map['name'],
        );

        // Simpan userId ke SharedPreferences
        await saveUserId(map['userId']);

        print("AccountController:: createAccount $result");
      } else {
        print("Error: Account is null");
      }
    } catch (error) {
      print("Error: $error");
    }
  }

// Metode untuk menyimpan userId ke SharedPreferences
  Future saveUserId(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', userId);
  }

  // SIGN IN
 Future<void> createEmailSession({
    required String email,
    required String password,
  }) async {
    try {
      // Mengambil userId dari SharedPreferences
      String? userId = await getSavedUserId();

      if (account != null) {
        final result = await account!.createEmailSession(
          email: email,
          password: password,
        );
        print(
            "AccountController:: createEmailSession $result, userId: $userId");
      } else {
        print("Error: Account is null");
      }
    } catch (error) {
      // Menampilkan dialog error menggunakan GetX.
      Get.defaultDialog(
        title: "Error Account",
        // ...
      );
    }
  }


// Metode untuk mengambil userId dari SharedPreferences
  Future<String?> getSavedUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }
}
