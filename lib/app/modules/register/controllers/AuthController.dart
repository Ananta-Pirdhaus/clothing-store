import 'dart:math';
import 'package:appwrite/appwrite.dart';
import 'package:clothing_store_app/app/modules/register/views/login_view.dart';
import 'package:clothing_store_app/app/modules/register/views/register_view.dart';
import 'package:clothing_store_app/app/modules/register/controllers/accountController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../routes/app_pages.dart';
import '../../../widget/clientController.dart';


String generateRandomString() {
  const characters =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789._-';
  final random = Random();
  return List.generate(
      36, (index) => characters[random.nextInt(characters.length)]).join();
}

class AuthController extends ClientController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AccountController accountController = Get.put(AccountController());

  RxBool isLoading = false.obs;
  RxBool isLoggedIn = false.obs;

 Future<void> registerUserAppwrite(
  String email, String password, String name) async {
  try {
    isLoading.value = true;
    final result = await accountController.createAccount({
      'userId': generateRandomString(), // Gunakan nilai dari ID.unique()
      'email': email, // Gunakan nilai dari parameter email
      'password': password, // Gunakan nilai dari parameter password
      'name': name, // Gunakan nilai dari parameter name
    });
    print(result);
    print("AccountController:: createAccount $result");
    Get.snackbar('Success', 'Registration successful',
        backgroundColor: Colors.green);
    Get.off(LoginView());
  } catch (error) {
    Get.snackbar('Error', 'Registration failed: $error',
        backgroundColor: Colors.red);
  } finally {
    isLoading.value = false;
  }
}

  Future<void> loginUser(String email, String password) async {
    try {
      isLoading.value = true;
      await accountController.createEmailSession(
        email: email,
        password: password,
      );

      isLoggedIn.value = true;

      Get.snackbar('Success', 'Login successful',
        backgroundColor: Colors.green);
      // Get.offAllNamed('/homepage');
    } catch (error) {
      Get.snackbar('Error', 'Login failed: $error',
        backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> Logout(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Konfirmasi"),
          content: Text("Apakah Anda yakin ingin keluar?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Get.find<AuthController>().isLoggedIn.value = false;
                Get.offNamed(Routes.LOGIN);
                Navigator.of(context).pop();
              },
              child: Text("Keluar"),
            ),
          ],
        );
      },
    );
  }
}



