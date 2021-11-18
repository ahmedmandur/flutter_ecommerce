import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/products/category_model.dart';

class FireStoreCategory {
  final CollectionReference _categoryCollection =
      FirebaseFirestore.instance.collection('categories');

  Future<List<CategoryModel>> getCateogries() async {
    return await _categoryCollection.get().then((value) {
      List<CategoryModel> categoryList = [];
      for (DocumentSnapshot doc in value.docs) {
        categoryList.add(
            CategoryModel.fromJson(doc.data() as Map<String, dynamic>, doc.id));
      }
      return categoryList;
    });
  }
}
