import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/features/home/presentation/view/widgets/category_rounded_widgets.dart';
import 'package:new_shope/features/home/presentation/view_model/provider/category_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/widgets/title_text.dart';

class GridViewCategory extends StatelessWidget {
  const GridViewCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleTextAppCustom(label: 'Categories', fontSize: 16.sp),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    showDragHandle: true,
                    backgroundColor: Colors.white,
                    context: context,
                    builder: (context) {
                      return DynamicHeightGridView(
                        builder: (context, index) {
                          return CategoriesRoundedWidgets(
                            id: categoryProvider.getCategoryList[index].id,
                            image:
                                categoryProvider.getCategoryList[index].image,
                            name: categoryProvider.getCategoryList[index].name,
                          );
                        },
                        itemCount: categoryProvider.getCategoryList.length,
                        crossAxisCount: 3,
                      );
                    },
                  );
                },
                child: TitleTextAppCustom(
                  label: 'see more',
                  fontSize: 12.sp,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          // SizedBox(
          //   height: 130.h,
          //   child: GridView(
          //     scrollDirection: Axis.horizontal,
          //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //       maxCrossAxisExtent: 200,
          //       childAspectRatio: 4 / 2,
          //       // crossAxisSpacing: 20,
          //       mainAxisSpacing: 20.w,
          //     ),
          //     children: List.generate(
          //       // CategoriesList.categoryList.length,
          //       6,
          //       (index) {
          //         return CategoriesRoundedWidgets(
          //           image: CategoriesList.categoryList[index].image,
          //           name: CategoriesList.categoryList[index].name,
          //         );
          //       },
          //     ),
          //   ),
          // ),
          Column(
            children: [
              categoryProvider.getCategoryList.length == 1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                        1,
                        (index) => ChangeNotifierProvider.value(
                          value: categoryProvider,
                          child: CategoriesRoundedWidgets(
                            image:
                                categoryProvider.getCategoryList[index].image,
                            name: categoryProvider.getCategoryList[index].name,
                            id: categoryProvider.getCategoryList[index].id,
                          ),
                        ),
                      ),
                    )
                  : categoryProvider.getCategoryList.length == 2
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                            2,
                            (index) => ChangeNotifierProvider.value(
                              value: categoryProvider,
                              child: CategoriesRoundedWidgets(
                                image: categoryProvider
                                    .getCategoryList[index].image,
                                name: categoryProvider
                                    .getCategoryList[index].name,
                                id: categoryProvider.getCategoryList[index].id,
                              ),
                            ),
                          ),
                        )
                      : categoryProvider.getCategoryList.length == 3
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: List.generate(
                                3,
                                (index) => ChangeNotifierProvider.value(
                                  value: categoryProvider,
                                  child: CategoriesRoundedWidgets(
                                    image: categoryProvider
                                        .getCategoryList[index].image,
                                    name: categoryProvider
                                        .getCategoryList[index].name,
                                    id: categoryProvider
                                        .getCategoryList[index].id,
                                  ),
                                ),
                              ),
                            )
                          : categoryProvider.getCategoryList.length == 4
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: List.generate(
                                      4,
                                      (index) => ChangeNotifierProvider.value(
                                        value: categoryProvider,
                                        child: CategoriesRoundedWidgets(
                                          image: categoryProvider
                                              .getCategoryList[index + 3].image,
                                          name: categoryProvider
                                              .getCategoryList[index + 3].name,
                                          id: categoryProvider
                                              .getCategoryList[index + 3].id,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : categoryProvider.getCategoryList.length == 5
                                  ? Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: List.generate(
                                          5,
                                          (index) =>
                                              ChangeNotifierProvider.value(
                                            value: categoryProvider,
                                            child: CategoriesRoundedWidgets(
                                              image: categoryProvider
                                                  .getCategoryList[index + 3]
                                                  .image,
                                              name: categoryProvider
                                                  .getCategoryList[index + 3]
                                                  .name,
                                              id: categoryProvider
                                                  .getCategoryList[index + 3]
                                                  .id,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: List.generate(
                                          6,
                                          (index) =>
                                              ChangeNotifierProvider.value(
                                            value: categoryProvider,
                                            child: CategoriesRoundedWidgets(
                                              image: categoryProvider
                                                  .getCategoryList[index + 3]
                                                  .image,
                                              name: categoryProvider
                                                  .getCategoryList[index + 3]
                                                  .name,
                                              id: categoryProvider
                                                  .getCategoryList[index + 3]
                                                  .id,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
              // const SizedBox(height: 15),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: List.generate(
              //     3,
              //     (index) => index != 3
              //         ? const SizedBox()
              //         : index != 4
              //             ? const SizedBox()
              //             : index != 2
              //                 ? const SizedBox()
              //                 : ChangeNotifierProvider.value(
              //                     value: categoryProvider,
              //                     child: CategoriesRoundedWidgets(
              //                       image: categoryProvider
              //                           .getCategoryList[index].image,
              //                       name: categoryProvider
              //                           .getCategoryList[index].name,
              //                       id: categoryProvider
              //                           .getCategoryList[index].id,
              //                     ),
              //                   ),
              //   ),
              // ),
              const SizedBox(height: 35)
            ],
          ),
        ],
      ),
    );
  }
}
