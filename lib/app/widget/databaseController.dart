import 'package:appwrite/appwrite.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'clientController.dart';

class DatabaseController extends ClientController {
  Databases? databases;

  @override
  void onInit() {
    super.onInit();
    // appwrite
    databases = Databases(client);
  }

  Future storeUserName(Map map) async {
    try {
      final result = await databases!.createDocument(
        databaseId: "65664c927c83b5166128",
        documentId: ID.unique(),
        collectionId: "65664cae5a588dcdce01",
        data: map,
        permissions: [
          Permission.read(Role.user("65664f2e673d081da3f0")),
          Permission.update(Role.user("65664f2e673d081da3f0")),
          Permission.delete(Role.user("65664f2e673d081da3f0")),
        ],
      );
      print("DatabaseController:: storeUserName $result");
    } catch (error) {
      Get.defaultDialog(
        title: "Error Database",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }
}
