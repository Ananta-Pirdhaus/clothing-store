import 'package:clothing_store_app/app/modules/shopping_cart/views/add_shopping_cart_views.dart';
import 'package:flutter/material.dart';
import 'package:clothing_store_app/app/modules/shopping_cart/models/database_helper.dart';
import 'package:clothing_store_app/app/modules/shopping_cart/models/shoppingcart_models.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ShoppingCartView extends StatefulWidget {
  @override
  _ShoppingCartViewState createState() => _ShoppingCartViewState();
}

class _ShoppingCartViewState extends State<ShoppingCartView> {
  List<ShoppingCartModels> data = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    try {
      List<ShoppingCartModels> shoppingCart =
          await DatabaseHelper.instance.getShoppingCart();

      setState(() {
        data = shoppingCart;
      });
    } catch (e) {
      print("Error loading data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              bool? result = await Get.to<bool>(() => const AddItems());

              if (result == true) {
                _loadData();
              }
            },
          ),
        ],
      ),
      body: data.isEmpty
          ? Center(
              child: Text('There are no items checked out yet'),
            )
          : Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(data[index].title),
                      subtitle: Text(data[index].price),
                      leading: Checkbox(
                        value: data[index].isCheckOut,
                        onChanged: (value) async {
                          setState(() {
                            data[index].isCheckOut = value!;
                          });

                          DatabaseHelper.instance
                              .updateShoppingCart(data[index]);
                        },
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          removeItem(index);
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          // Tambahkan logika untuk proses checkout di sini
                        },
                        child: Text('Checkout'),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Total:'),
                          Text('\$${calculateTotal()}'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  void removeItem(int index) async {
    DatabaseHelper.instance.deleteShoppingCart(data[index].id);

    setState(() {
      data.removeAt(index);
    });
  }

  double calculateTotal() {
    double total = 0;
    for (var item in data) {
      if (item.isCheckOut) {
        total += double.parse(item.price);
      }
    }
    return total;
  }
}
