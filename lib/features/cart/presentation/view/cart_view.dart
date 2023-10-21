import 'package:flutter/material.dart';
import 'package:new_shope/features/cart/presentation/view/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  static const kCart = '/kCartView';
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CartViewBody(),
    );
  }
}
