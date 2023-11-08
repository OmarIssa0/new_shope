import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/home/presentation/view/widgets/box_item_card.dart';
import 'package:new_shope/features/home/presentation/view/widgets/swiper_image.dart';
import 'package:new_shope/features/search/presentation/manger/provider/product_provider.dart';
import 'package:provider/provider.dart';
import 'grid_view_category.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    // final passedCategory = ModalRoute.of(context)!.settings.arguments;

    // final List<ProductModel> productList = passedCategory == null
    //     ? productProvider.getProducts
    //     : productProvider.findByCategory(
    //         categoryName: passedCategory.toString());
    // Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SwiperImage(),
          SizedBox(
            height: 25.h,
          ),
          const GridViewCategory(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleTextAppCustom(
                  label: 'Featured Product',
                  fontSize: 16.sp,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(25.r),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TitleTextAppCustom(
                      label: 'See All',
                      fontSize: 12.sp,
                      color: const Color(0xff3669C9),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            height: 240.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productProvider.getProducts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7.5),
                  child: ChangeNotifierProvider.value(
                    value: productProvider.getProducts[index],
                    child: BoxItemCard(
                      productId: productProvider.getProducts[index].productId,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 150,
          ),
        ],
      ),
    );
  }
}
