import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/features/home/presentation/view/widgets/category_rounded_widgets.dart';

import '../../../../../core/utils/widgets/title_text.dart';
import '../../view_model/model/list_model_category.dart';

class GridViewCategory extends StatelessWidget {
  const GridViewCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleTextAppCustom(label: 'Categories', fontSize: 16.sp),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            height: 130.h,
            child: GridView(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 4 / 2,
                // crossAxisSpacing: 20,
                mainAxisSpacing: 20.w,
              ),
              children: List.generate(
                CategoriesList.categoryList.length,
                (index) {
                  return CategoriesRoundedWidgets(
                    image: CategoriesList.categoryList[index].image,
                    name: CategoriesList.categoryList[index].name,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
