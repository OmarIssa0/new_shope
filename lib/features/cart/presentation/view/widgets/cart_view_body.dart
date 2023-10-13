import 'package:flutter/material.dart';
import 'package:new_shope/core/utils/widgets/empty_widgets.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/cart/presentation/view/widgets/cart_widgets.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? const Column(
            children: [
              EmptyWidgets(
                title: 'Whoops!',
                subTitle: 'Your cart is empty',
                titleBottom: 'Shope Now',
              ),
            ],
          )
        : Scaffold(
            appBar: AppBar(
              foregroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              backgroundColor: Colors.white,
              title: const Row(
                // crossAxisAlignment: CrossAxisAlignment.,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TitleTextAppCustom(
                    label: 'Cart (5)',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete_forever_outlined,
                    color: Colors.red.shade400,
                  ),
                ),
              ],
            ),
            body: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return const CartWidgets();
              },
            ),
          );
  }
}
