import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/features/home/presentation/view/widgets/category_rounded_widgets.dart';

import '../../../../../core/utils/widgets/title_text.dart';
import '../../view_model/list_model_category.dart';

class GridViewCategory extends StatelessWidget {
  const GridViewCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleTextAppCustom(label: 'Categories', fontSize: 16.sp),
        SizedBox(
          height: 17.h,
        ),
        SizedBox(
          height: 100.h,
          child: GridView(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              // crossAxisSpacing: 20,
              mainAxisSpacing: 20.w,
            ),
            children: List.generate(
              CategoriesList.categoryList.length,
              (index) {
                return CategoriesRoundedWidgets(
                  image: CategoriesList.categoryList[index].image,
                  title: CategoriesList.categoryList[index].name,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
