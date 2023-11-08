import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_shope/core/utils/app_image.dart';
import 'package:new_shope/core/utils/widgets/alert_dialog.dart';
import 'package:new_shope/features/cart/presentation/manger/model/cart_model.dart';
import 'package:new_shope/features/search/presentation/manger/model/product.model.dart';
import 'package:new_shope/features/search/presentation/manger/provider/product_provider.dart';
import 'package:uuid/uuid.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> _cartItem = {};

  Map<String, CartModel> get getCartItem {
    return _cartItem;
  }

  // firebase
  final usersDB = FirebaseFirestore.instance.collection("users");
  final _auth = FirebaseAuth.instance;
  Future<void> addToCartFirebase({
    required String productId,
    required int qty,
    required BuildContext context,
  }) async {
    final User? user = _auth.currentUser;
    if (user == null) {
      AlertDialogMethods.showError(
        context: context,
        subtitle: "No user found",
        titleBottom: "Ok",
        lottileAnimation: MangerImage.kError,
        function: () {
          Navigator.pop(context);
        },
      );
      return;
    }

    final uid = user.uid;
    final cartId = const Uuid().v4();

    try {
      usersDB.doc(uid).update({
        "userCart": FieldValue.arrayUnion([
          {
            "cartId": cartId,
            "productId": productId,
            "quantity": qty,
          }
        ])
      });
      await fetchCart();
      Fluttertoast.showToast(msg: "Item has been added to cart");
    } catch (e) {}
  }

  Future<void> fetchCart() async {
    User? user = _auth.currentUser;
    if (user == null) {
      log("the function has been called and the user is null");
      _cartItem.clear();
      return;
    }
    try {
      final userDoc = await usersDB.doc(user.uid).get();
      final data = userDoc.data();
      if (data == null || !data.containsKey("userCart")) {
        return;
      }
      final leng = userDoc.get("userCart").length;
      for (int index = 0; index < leng; index++) {
        _cartItem.putIfAbsent(
          userDoc.get('userCart')[index]['productId'],
          () => CartModel(
            cartID: userDoc.get('userCart')[index]['cartId'],
            productID: userDoc.get('userCart')[index]['productId'],
            quantity: userDoc.get('userCart')[index]['quantity'],
          ),
        );
      }
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  //check id product
  bool isProductInCart({required String productId}) {
    return _cartItem.containsKey(productId);
  }

  // add cart
  void addProductToCart({required String productID}) {
    // اذا الفانكشن فيها ال
    // ID اتجاهلها
    _cartItem.putIfAbsent(
      productID,
      () => CartModel(
        cartID: const Uuid().v4(),
        productID: productID,
        quantity: 1,
      ),
    );
    notifyListeners();
  }

  // نزيد عدد المنتج
  void updateQuantity({required String productId, required int quantity}) {
    _cartItem.update(
      productId,
      (item) => CartModel(
        cartID: item.cartID,
        productID: productId,
        quantity: quantity,
      ),
    );
    notifyListeners();
  }

  // get total price product
  double getTotal({required ProductProvider productProvider}) {
    double total = 0;
    _cartItem.forEach((key, value) {
      final ProductModel? getCurrentProduct =
          productProvider.findByProductId(value.productID);
      if (getCurrentProduct == null) {
        return;
      } else {
        total += double.parse(getCurrentProduct.productPrice) * value.quantity;
      }
    });
    return total;
  }

  int getQty() {
    int total = 0;
    _cartItem.forEach((key, value) {
      total += value.quantity;
    });
    return total;
  }

  // delete one item => icon bottom
  void removeOneItem({required String productId}) {
    _cartItem.remove(productId);
    notifyListeners();
  }

  // delete all product => clear all cart
  void clearLocal() {
    _cartItem.clear();
    notifyListeners();
  }
}
