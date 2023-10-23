import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/search/presentation/view/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  static const kSearch = '/kSearchView';
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    // send category Navigator
    String? categoryNav = ModalRoute.of(context)!.settings.arguments as String?;
    // final productProvider = Provider.of<ProductProvider>(context);

    // final List<ProductModel> productList = categoryNav == null
    //     ? productProvider.getProducts
    //     : productProvider.findByCategory(categoryName: categoryNav);

    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        //   icon: const Icon(
        //     IconlyLight.arrow_left_2,
        //     color: Colors.black,
        //   ),
        // ),
        automaticallyImplyLeading: false,
        title: TitleTextAppCustom(
          label: categoryNav ?? "Search",
          fontSize: 20.sp,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: const SearchViewBody(),
      ),
    );
  }
}
