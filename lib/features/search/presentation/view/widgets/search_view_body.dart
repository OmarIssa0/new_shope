import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/features/search/presentation/view/widgets/product_widgets.dart';
import 'package:new_shope/features/search/presentation/view/widgets/text_filed_search.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
              itemCount: 220,
              crossAxisCount: 2,
              builder: (context, index) {
                return const ProductWidgets();
              },
            ),
          ),
        ],
      ),
    );
  }
}
