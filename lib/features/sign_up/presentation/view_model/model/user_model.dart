import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  final String userId, userName, userImage, userEmail;
  final Timestamp timestamp;
  final List userCart, userWishlist;

  UserModel({
    required this.userId,
    required this.userImage,
    required this.userEmail,
    required this.timestamp,
    required this.userCart,
    required this.userWishlist,
    required this.userName,
  });
}
