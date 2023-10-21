import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/features/search/presentation/view/widgets/product_widgets.dart';
import 'package:new_shope/features/search/presentation/view/widgets/text_filed_search.dart';
import 'package:provider/provider.dart';

import '../../manger/provider/product_provider.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final productProviderSearch = Provider.of<ProductProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
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
              itemCount: productProviderSearch.getProducts.length,
              crossAxisCount: 2,
              builder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: productProviderSearch.getProducts[index],
                  child: ProductWidgets(
                    productId:
                        productProviderSearch.getProducts[index].productId,
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
