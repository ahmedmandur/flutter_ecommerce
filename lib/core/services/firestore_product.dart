import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/products/product_model.dart';

class FireStoreProduct {
  final CollectionReference _productsCollection =
      FirebaseFirestore.instance.collection('products');

  Future<List<ProductModel>> getProducts() async {
    return await _productsCollection.get().then((value) {
      List<ProductModel> productList = [];
      for (DocumentSnapshot doc in value.docs) {
        productList.add(
            ProductModel.fromJson(doc.data() as Map<String, dynamic>, doc.id));
      }
      return productList;
    });
  }
}
