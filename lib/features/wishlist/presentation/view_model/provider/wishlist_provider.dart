import 'package:flutter/material.dart';
import 'package:new_shope/features/wishlist/presentation/view_model/model/wishlist_model.dart';
import 'package:uuid/uuid.dart';

class WishlistProvider with ChangeNotifier {
  final Map<String, WishlistModel> _wishlistItems = {};

  Map<String, WishlistModel> get getWishlistItem {
    return _wishlistItems;
  }

  //check id product
  bool isProductInWishlist({required String productId}) {
    return _wishlistItems.containsKey(productId);
  }

  // add wishlist
  void addProductToCartAndRemoveWishlist({required String productID}) {
    //  اذا المنتح موجود وكبست عليه راح يحذف
    if (_wishlistItems.containsKey(productID)) {
      _wishlistItems.remove(productID);
    } else {
      _wishlistItems.putIfAbsent(
        productID,
        () => WishlistModel(
          id: const Uuid().v4(),
          productId: productID,
        ),
      );
    }
    notifyListeners();
  }

  // نزيد عدد المنتج

  // delete all product => clear all cart
  void clearLocalWishlist() {
    _wishlistItems.clear();
    notifyListeners();
  }
}
