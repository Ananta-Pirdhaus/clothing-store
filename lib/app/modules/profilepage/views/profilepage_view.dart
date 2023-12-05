import 'dart:io';
import 'package:clothing_store_app/app/widget/navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../routes/app_pages.dart';
import '../../register/controllers/AuthController.dart';
import '../controllers/profilepage_controller.dart';

class ProfilepageView extends StatefulWidget {
  ProfilepageView({Key? key}) : super(key: key);

  @override
  State <ProfilepageView> createState() => _ProfilepageView();
}

class _ProfilepageView extends State<ProfilepageView> {

final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProfilepageController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
          Icons.chevron_left,
          color: Colors.black,
          size: 30,
        ),
        onPressed: () { 
        Get.toNamed(Routes.HOMEPAGE);    
        },
      ),
        title: Text(
          'Profile', 
          style: TextStyle(color: Colors.black),
          ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.exit_to_app, 
              color: Colors.black,
              ),
            onPressed: () {
          _authController.Logout(context);
          },
        ),
      ],
    ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  child: GetBuilder<ProfilepageController>(
                    builder: (c) => c.upIm != null
                        ? CircleAvatar(
                            radius: 64,
                            backgroundImage: MemoryImage(c.upIm!),
                          )
                        : const CircleAvatar(
                            radius: 64,
                            backgroundImage:
                                AssetImage('assets/images/avatarImage.png'),
                          ),
                  ),
                ),
                Positioned(
                  child: IconButton(
                    onPressed: () => 
                    Get.find<ProfilepageController>().selectImage(ImageSource.camera),
                    icon: const Icon(Icons.add_a_photo),
                  ),
                  bottom: -10,
                  left: 80,
                ),
                Positioned(
                  child: IconButton(
                    onPressed: () =>
                    Get.find<ProfilepageController>().selectImage(ImageSource.gallery),
                    icon: const Icon(Icons.add),
                  ),
                  bottom: -10,
                  left: 0,
                ),
              ],
            ),
            Text(
              "Profile",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 250, 0),
              child: GetBuilder<ProfilepageController>(
                builder: (c) => c.pickedImage != null
                    ? Column(
                        children: [
                          Container(
                            height: 110,
                            width: 125,
                            child: Stack(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(100),
                                    image: DecorationImage(
                                      image: FileImage(
                                        File(c.pickedImage!.path),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: -10,
                                  right: 10,
                                  child: IconButton(
                                    onPressed: () => c.resetImage(),
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red[900],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text("Gambar di pilih"),
                        ],
                      )
                    : Text("No picture selected"),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Navbar(currentIndex: 3),
    );
  }
}