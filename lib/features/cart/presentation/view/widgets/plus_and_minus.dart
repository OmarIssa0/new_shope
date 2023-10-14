import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../../../../core/utils/widgets/title_text.dart';

class PlusAndMinusCount extends StatefulWidget {
  const PlusAndMinusCount({super.key});

  @override
  State<PlusAndMinusCount> createState() => _PlusAndMinusCountState();
}

class _PlusAndMinusCountState extends State<PlusAndMinusCount> {
  int numberCount = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 30,
      // width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        // color: Colors.black,
        border: const Border(
          top: BorderSide(width: 1),
          bottom: BorderSide(width: 1),
          left: BorderSide(width: 1),
          right: BorderSide(width: 1),
        ),
      ),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(width: 1),
              ),
            ),
            child: InkWell(
              onTap: () {
                if (numberCount == 1) {
                } else if (numberCount >= 1) {
                  numberCount--;
                  setState(() {});
                }
              },
              child: Icon(
                IconlyBold.arrow_left_2,
                size: 32,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          SizedBox(
            width: 13.w,
          ),
          TitleTextAppCustom(label: '$numberCount', fontSize: 18.sp),
          SizedBox(
            width: 13.w,
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(width: 1),
              ),
            ),
            child: InkWell(
              onTap: () {
                numberCount++;
                setState(() {});
              },
              child: Icon(
                IconlyBold.arrow_right_2,
                size: 32,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
