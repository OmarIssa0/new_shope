import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  final String productId,
      productTitle,
      productPrice,
      productCategory,
      productDescription,
      productImage,
      productQuantity;
  Timestamp? createdAt;

  ProductModel({
    required this.productId,
    required this.productTitle,
    required this.productPrice,
    required this.productCategory,
    required this.productDescription,
    required this.productImage,
    required this.productQuantity,
    this.createdAt,
  });

  // factory ProductModel.formFirestoreData(DocumentSnapshot doc) {
  //   Map data = doc.data() as Map<String, dynamic>;
  //   return ProductModel(
  //     productId: data['productId'],
  //     productTitle: data['userTitle'],
  //     productPrice: data['userPrice'],
  //     productCategory: data['userCategory'],
  //     productDescription: data['userDescription'],
  //     productImage: data['userDescription'],
  //     productQuantity: data['userQuantity'],
  //     createdAt: data['createdAt'] as dynamic,
  //   );
  // }
  // factory ProductModel.fromFirestore(DocumentSnapshot doc) {
  //   Map data = doc.data() as Map<String, dynamic>;
  //   return ProductModel(
  //     productId:
  //         doc.get("productId"), //  data['productId'], //doc.get("productId"),
  //     productTitle: doc.get("productTitle"), //data['productTitle'],
  //     productPrice: doc.get("productPrice"), //data['productPrice'],
  //     productCategory: doc.get("productPrice"), //data['productPrice'],
  //     productDescription:
  //         doc.get("productDescription"), // data['productDescription'],
  //     productImage: doc.get("productImage"), //data['productImage'],
  //     productQuantity: doc.get("productQuantity"), //data['productQuantity'],
  //     createdAt: doc.get("createdAt"), // data['createdAt'],
  //   );
  // }
  factory ProductModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return ProductModel(
      productId: data['productId'], //doc.get("productId"),
      productTitle: data['productTitle'],
      productPrice: data['productPrice'],
      productCategory: data['productCategory'],
      productDescription: data['productDescription'],
      productImage: data['productImage'],
      productQuantity: data['productQuantity'],
      createdAt: data['createdAt'],
    );
  }
}
 