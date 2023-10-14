
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/features/home/presentation/view/widgets/item_card.dart';

class BoxItemCard extends StatelessWidget {
  const BoxItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
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
