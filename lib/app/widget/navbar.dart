import 'package:clothing_store_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Navbar extends StatelessWidget {
  final int currentIndex;
  Navbar({Key? key, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(FontAwesomeIcons.home,
                color: currentIndex == 0 ? Colors.white : Colors.grey[400]),
            onPressed: () {
              Get.toNamed(Routes.HOMEPAGE);
            },
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.listAlt,
                color: currentIndex == 1 ? Colors.white : Colors.grey[400]),
            onPressed: () {
              Get.toNamed(Routes.PRODUCT);
            },
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.shoppingCart,
                color: currentIndex == 2 ? Colors.white : Colors.grey[400]),
            onPressed: () {
              Get.toNamed(Routes.SHOPPINGCART);
            },
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.user,
                color: currentIndex == 3 ? Colors.white : Colors.grey[400]),
            onPressed: () {
              Get.toNamed(Routes.PROFILEPAGE);
            },
          ),
        ],
      ),
    );
  }
}
