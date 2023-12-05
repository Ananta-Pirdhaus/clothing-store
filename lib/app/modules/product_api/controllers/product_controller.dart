import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  ProductsRepository productsRepository = ProductsRepository();
  RxBool loading = false.obs;
  RxList<dynamic> products = <dynamic>[].obs;
  RxBool showGrid = false.obs;

  ProductController() {
    loadProductsFromRepo();
  }

  loadProductsFromRepo() async {
    loading(true);
    try {
      var productsData = await productsRepository.loadProductsFromApi();
      products.assignAll(productsData);
    } catch (e) {
      print("Error loading products: $e");
    }
    loading(false);
  }

  toggleGrid() {
    showGrid(!showGrid.value);
  }
}

class ProductsRepository {
  final String apiUrl = "https://fakestoreapi.com/products";

  Future<List<dynamic>> loadProductsFromApi() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
