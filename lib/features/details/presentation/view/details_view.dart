import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:iconly/iconly.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/details/presentation/view/widgets/bottom_nav_bar_details_view.dart';
import 'package:new_shope/features/details/presentation/view/widgets/details_view_body.dart';
import 'package:provider/provider.dart';

import '../../../search/presentation/manger/provider/product_provider.dart';

class DetailsView extends StatelessWidget {
  static const kDetails = '/kDetailsView';
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final productProviderDetails =
        Provider.of<ProductProvider>(context, listen: false);

    // Navigator
    String productId = ModalRoute.of(context)!.settings.arguments as String;
    // ignore: unused_local_variable
    final getCurrentProduct = productProviderDetails.findByProductId(productId);

    // final productModel = Provider.of<ProductModel>(context);
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: TitleTextAppCustom(
          label: 'Details Product',
          fontSize: 20.sp,
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            IconlyLight.arrow_left_2,
            color: Colors.black,
          ),
        ),
        elevation: 5,
      ),
      bottomNavigationBar: BottomNavBarDetailsView(
        productId: productId,
      ),
      body: const DetailsViewBody(),
    );
  }
}
