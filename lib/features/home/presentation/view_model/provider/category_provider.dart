import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_shope/features/home/presentation/view_model/model/model_category.dart';

class CategoryProvider extends ChangeNotifier {
  final List<CategoryModel> categoryList = [];

  List<CategoryModel> get getCategoryList {
    return categoryList;
  }

  CategoryModel? findByCategoryId(String categoryId) {
    // اذا حصلنا اي منتج داخل ال List
    if (categoryList.where((element) => element.id == categoryId).isEmpty) {
      return null;
    }
    // اول وحدة بترجع
    return categoryList.firstWhere((element) => element.id == categoryId);
  }

  final categoryDB = FirebaseFirestore.instance.collection("categories");
  Future<List<CategoryModel>> fetchCategory() async {
    try {
      await categoryDB
          .orderBy("createdAt", descending: false)
          .get()
          .then((categorySnapshot) {
        categoryList.clear();
        for (var element in categorySnapshot.docs) {
          categoryList.insert(0, CategoryModel.fromFirestore(element));
        }
      });
      notifyListeners();
      return categoryList;
    } on FirebaseException {
      rethrow;
    }
  }

  Stream<List<CategoryModel>> fetchCategoryStream() {
    try {
      return categoryDB.snapshots().map((snapshot) {
        categoryList.clear();
        for (var element in snapshot.docs) {
          categoryList.insert(0, CategoryModel.fromFirestore(element));
        }
        return categoryList;
      });
    } catch (e) {
      rethrow;
    }
  }

  // final List<CategoryModel> categoryList = [
  //   CategoryModel(
  //     id: "1",
  //     name: "Electronics",
  //     image:
  //         "https://icons.veryicon.com/png/o/miscellaneous/8atour/submit-successfully.png",
  //   ),
  //   CategoryModel(
  //     id: "2",
  //     name: "Fashion",
  //     image:
  //         "https://icons.veryicon.com/png/o/miscellaneous/8atour/submit-successfully.png",
  //   ),
  //   CategoryModel(
  //     id: "3",
  //     name: "Shoes",
  //     image:
  //         "https://icons.veryicon.com/png/o/miscellaneous/8atour/submit-successfully.png",
  //   ),
  //   CategoryModel(
  //     id: "4",
  //     name: "Watch",
  //     image:
  //         "https://icons.veryicon.com/png/o/miscellaneous/8atour/submit-successfully.png",
  //   ),
  //   CategoryModel(
  //     id: "5",
  //     name: "Pc",
  //     image:
  //         "https://icons.veryicon.com/png/o/miscellaneous/8atour/submit-successfully.png",
  //   )
  // ];
}
