import 'package:clothing_store_app/app/modules/shopping_cart/models/database_helper.dart';
import 'package:clothing_store_app/app/modules/shopping_cart/views/shopping_cart_views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

class AddItems extends StatefulWidget {
  const AddItems({Key? key}) : super(key: key);

  @override
  State<AddItems> createState() => AddItemsState();
}

class AddItemsState extends State<AddItems> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _price = ''; // Added price field // Added isCheckOut field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Item"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Title",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter title";
                  }
                  return null;
                },
                onSaved: (newValue) => _title = newValue ?? "Title",
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Price (in dollars)",
                ),
                keyboardType: TextInputType.number,
                onSaved: (newValue) => _price = newValue ?? "0.0",
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    try {
                      bool result = await DatabaseHelper.instance.createShoppingCart(
                        title: _title,
                        price: _price,
                      );

                      if (result) {
                        Get.snackbar(
                          "Success",
                          "Added item successfully",
                          duration: Duration(seconds: 2),
                          snackPosition: SnackPosition.TOP,
                        );
                        Get.to(() => ShoppingCartView());
                      }
                    } catch (e) {
                      print(e);
                      Get.snackbar(
                        "Error",
                        e.toString(),
                        duration: Duration(seconds: 2),
                        snackPosition: SnackPosition.TOP,
                      );
                    }
                  }
                },
                child: const Text("Add Item"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
