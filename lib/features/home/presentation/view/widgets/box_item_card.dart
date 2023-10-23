import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:new_shope/features/home/presentation/view/widgets/item_card.dart';
import 'package:provider/provider.dart';

import '../../../../details/presentation/view/details_view.dart';
import '../../../../search/presentation/manger/provider/product_provider.dart';

class BoxItemCard extends StatelessWidget {
  const BoxItemCard({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final productProviderSearch = Provider.of<ProductProvider>(context);
    final getCurrentProduct = productProviderSearch.findByProductId(productId);
    return GestureDetector(
      onTap: () async {
        Navigator.of(context).pushNamed(DetailsView.kDetails,
            arguments: getCurrentProduct!.productId);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.r, vertical: 7.5.r),
        child: Material(
          shadowColor: Colors.white70,
          type: MaterialType.card,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          elevation: 3,
          color: Colors.white,
          child: const ItemCard(),
        ),
      ),
    );
  }
}
