import 'package:clothing_store_app/app/modules/register/bindings/login_binding.dart';
import 'package:clothing_store_app/app/routes/app_pages.dart';
import 'package:clothing_store_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'app/widget/notification_handler.dart';
import 'package:google_sign_in/google_sign_in.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

await FirebaseMessagingHandler().initPushNotification();
await FirebaseMessagingHandler().initLocalNotification();

  runApp(
    GetMaterialApp(
     debugShowCheckedModeBanner: false,
     title: "Application",
     initialRoute: AppPages.INITIAL,
     getPages: AppPages.routes,
    ),
  );
}


GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: RegisterBinding(),
    );
  }
}
