import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/features/search/presentation/view/widgets/product_widgets.dart';
import 'package:new_shope/features/search/presentation/view/widgets/text_filed_search.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/widgets/title_text.dart';
import '../../manger/model/product.model.dart';
import '../../manger/provider/product_provider.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // // product provider
    // final productProviderSearchView = Provider.of<ProductProvider>(context);
    // // send category Navigator
    // final categoryNav = ModalRoute.of(context)!.settings.arguments as String?;
    // // product model
    // final List<ProductModel> providerList = categoryNav == null
    //     ? productProviderSearchView.getProducts
    //     : productProviderSearchView.findByCategory(categoryName: categoryNav);

    final productProvider = Provider.of<ProductProvider>(context);

    final passedCategory = ModalRoute.of(context)!.settings.arguments;

    final List<ProductModel> productList = passedCategory == null
        ? productProvider.getProducts
        : productProvider.findByCategory(
            categoryName: passedCategory.toString());
    // Ui
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: productList.isEmpty
          ? Center(
              child: TitleTextAppCustom(
                label: 'No product found',
                fontSize: 20.sp,
              ),
            )
          : Column(
              children: [
                SizedBox(
                  height: 15.h,
                ),
                const TextFiledSearch(),
                SizedBox(
                  height: 15.h,
                ),
                Expanded(
                  child: DynamicHeightGridView(
                    itemCount: productList.length,
                    crossAxisCount: 2,
                    builder: (context, index) {
                      return ChangeNotifierProvider.value(
                        value: productList[index],
                        child: ProductWidgets(
                          productId: productList[index].productId,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
