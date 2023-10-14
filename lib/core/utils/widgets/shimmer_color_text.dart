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
      period: const Duration(seconds: 3),
      baseColor: const Color.fromARGB(255, 0, 0, 0),
      highlightColor: const Color.fromARGB(142, 94, 96, 96),
      child: TitleTextAppCustom(
        // fontWeight: FontWeight.w600,
        label: label,
        fontSize: fontSize,
      ),
    );
  }
}
