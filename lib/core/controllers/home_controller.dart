import 'package:ecommerce/core/services/firestore_category.dart';
import 'package:ecommerce/core/services/firestore_product.dart';
import 'package:ecommerce/models/products/category_model.dart';
import 'package:ecommerce/models/products/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ValueNotifier<bool> _isLoading = ValueNotifier(false);
  get isLoading => _isLoading;

  List<CategoryModel> _categories = [];
  get categories => _categories;

  List<ProductModel> _products = [];
  get products => _products;

  HomeController() {
    getCategories();
  }

  void getCategories() async {
    _isLoading.value = true;

    await FireStoreCategory().getCateogries().then((value) {
      _categories = value;

      update();
    }).then((value) async {
      await FireStoreProduct().getProducts().then((value) {
        _isLoading.value = false;
        _products = value;
        update();
      });
    });
  }
}
