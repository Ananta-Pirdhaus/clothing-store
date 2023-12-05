import 'package:clothing_store_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../views/webview_page.dart';
import '../views/widget/list.dart';
import 'package:clothing_store_app/app/widget/navbar.dart';

class HomePage extends GetView<HomePage> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        imagePath: 'assets/images/1.jpg',
        productName: 'Stripe Blouse',
        size: 'S | M | L | XL',
        price: 100,
      ),
      Product(
        imagePath: 'assets/images/2.jpg',
        productName: 'Rabbit Crop Top',
        size: 'S | M | L | XL',
        price: 120,
      ),
      Product(
        imagePath: 'assets/images/3.jpg',
        productName: 'Black Midi Dress',
        size: 'S | M | L | XL',
        price: 90,
      ),
      Product(
        imagePath: 'assets/images/4.jpg',
        productName: 'Yellow Set',
        size: 'S | M | L | XL',
        price: 200,
      ),
    ];

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
                Get.toNamed(Routes.LOGIN);    
            },
              ),
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/pacar.jpeg'),
                    radius: 20,
                  ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end, 
                children: [
                  Align(
                    alignment: Alignment.centerRight, 
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Text(
                    'Ruby Jane',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 10,
          bottom: 50,
          left: 10,
        ),
        child: Column(
          children: [
            
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  suffixIcon: ElevatedButton(
                    onPressed: () {
                      // Handle search action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: CircleBorder(),
                    ),
                    child: Icon(FontAwesomeIcons.search),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            //WEB VIEW
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebviewPage(),
                    ),
                  );
                },
                // Banner
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bann.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            // Best Selling Text
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Best Selling',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'roboto',
                  ),
                ),
              ),
            ),
            ProductList(products: products),
          ],
        ),
      ),
      bottomNavigationBar: Navbar(currentIndex: 0),
    );
  }
}
 