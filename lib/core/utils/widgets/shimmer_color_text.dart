import 'package:flutter/material.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTextWidget extends StatelessWidget {
  const ShimmerTextWidget({
    super.key,
    required this.label,
    required this.fontSize,
  });

  final String label;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(microseconds: 1),
      baseColor: Colors.black,
      highlightColor: Colors.white,
      child: TitleTextAppCustom(
        fontWeight: FontWeight.w600,
        label: label,
        fontSize: fontSize,
      ),
    );
  }
}
