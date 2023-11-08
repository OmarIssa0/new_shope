import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_shope/features/sign_up/presentation/view_model/model/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? userModel;
  UserModel? get getUserModel {
    return userModel;
  }

  Future<UserModel?> fatchUserInfo() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user == null) {
      return null;
    }
    var uid = user.uid;
    try {
      final userDoc =
          await FirebaseFirestore.instance.collection("users").doc(uid).get();
      final userDocMap = userDoc.data();
      userModel = UserModel(
        userId: userDoc.get("userId"),
        userImage: userDoc.get("userImage"),
        userEmail: userDoc.get("userEmail"),
        timestamp: userDoc.get("createdAt"),
        userName: userDoc.get("userName"),
        userCart:
            userDocMap!.containsKey("userCart") ? userDoc.get("userCart") : [],
        userWishlist: userDocMap.containsKey("userWishlist")
            ? userDoc.get("userWishlist")
            : [],
      );
    } on FirebaseException catch (error) {
      throw error.message.toString();
    } catch (error) {
      rethrow;
    }
    return userModel;
  }
}
