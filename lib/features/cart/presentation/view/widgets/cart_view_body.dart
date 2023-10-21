import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/utils/widgets/empty_widgets.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/cart/presentation/view/widgets/cart_widgets.dart';
import 'package:new_shope/features/home/presentation/view/home_view.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Column(
            children: [
              EmptyWidgets(
                title: 'Whoops!',
                subTitle: 'Your cart is empty',
                titleBottom: 'Shope Now',
                function: () {
                  Navigator.of(context).pushNamed(HomeView.kHome);
                },
              ),
            ],
          )
        : Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: TitleTextAppCustom(
                label: 'Cart (5)',
                fontSize: 20.sp,
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete_forever_outlined,
                    color: Colors.red.shade400,
                    size: 28,
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50.h,
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleTextAppCustom(
                                label: 'Total (6 products/6 item)',
                                fontSize: 14.sp),
                            SizedBox(
                              height: 4.h,
                            ),
                            TitleTextAppCustom(
                              label: '16.99\$',
                              fontSize: 14.sp,
                              color: Colors.blue.shade900,
                            ),
                          ],
                        ),
                        MaterialButton(
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          color: Colors.grey.shade200,
                          onPressed: () {},
                          child: TitleTextAppCustom(
                            label: 'Checkout',
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.black26,
                  height: 5,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return const CartWidgets();
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
