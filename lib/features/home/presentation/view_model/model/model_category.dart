import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryModel extends ChangeNotifier {
  final String id, image, name;

  final Timestamp? createdAt;

  CategoryModel({
    required this.id,
    required this.image,
    required this.name,
    this.createdAt,
  });
  factory CategoryModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return CategoryModel(
      id: data['categoryID'],
      image: data['productImage'],
      name: data['productTitle'],
      createdAt: data['createdAt'],
    );
  }
}
