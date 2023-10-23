import 'package:flutter/material.dart';
import 'package:new_shope/features/cart/presentation/manger/model/cart_model.dart';
import 'package:new_shope/features/search/presentation/manger/model/product.model.dart';
import 'package:new_shope/features/search/presentation/manger/provider/product_provider.dart';
import 'package:uuid/uuid.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> _cartItem = {};

  Map<String, CartModel> get getCartItem {
    return _cartItem;
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
