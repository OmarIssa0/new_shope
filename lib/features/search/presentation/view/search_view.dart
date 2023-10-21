import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/search/presentation/view/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TitleTextAppCustom(label: 'Search', fontSize: 20.sp),
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
