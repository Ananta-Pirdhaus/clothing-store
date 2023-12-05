import 'package:clothing_store_app/app/widget/navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/product_controller.dart';

class Product extends StatelessWidget {
  final ProductController productsController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTop(),
             Expanded(
              child: Obx(
                () {
                  if (productsController.loading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else if (productsController.showGrid.value) {
                    return GridView.builder(
                      padding: EdgeInsets.only(top: 16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                       childAspectRatio: 0.7,
                      ),
                      itemCount: productsController.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildProductCard(productsController.products[index]);
                      },
                    );
                  } else {
                    return _buildProductsList();
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Navbar(currentIndex: 1),
    );
  }

Widget _buildProductCard(Map<String, dynamic> product) {
  return Card(
    elevation: 4.0,
    child: Container(
      height: 100,
      padding: EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(product["image"]),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product["title"],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                product["description"],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "\$${product["price"]}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

   ListView _buildProductsList() {
    return ListView.builder(
      itemCount: productsController.products.length,
      padding: EdgeInsets.only(top: 16),
      itemBuilder: (context, index) => Card(
        elevation: 0.0,
        child: Container(
          height: 120,
          padding: EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              Container(
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        productsController.products[index]["image"]),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productsController.products[index]["title"],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Expanded(
                        child: Text(
                          productsController.products[index]["description"],
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "\$${productsController.products[index]["price"]}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row _buildTop() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Clothes",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            productsController.toggleGrid();
          },
          icon: Icon(Icons.filter_list),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
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
      elevation: 0,
      title: Text(
        "Shop Here",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
