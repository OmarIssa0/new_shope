import 'package:flutter/material.dart';
import 'package:new_shope/core/utils/widgets/empty_widgets.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        EmptyWidgets(
          title: 'Whoops!',
          subTitle: 'Your cart is empty',
          titleBottom: 'Shope Now',
        ),
      ],
    );
  }
}
