import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../config/app_theme.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Expanded(
          child: Container(
            height: .2.h,
            color: AppTheme.primary,
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Text("OR",style: AppTheme.mainTextStyle(color: AppTheme.primary),),
        ),

        Expanded(
          child: Container(
            height: .2.h,
            color: AppTheme.primary,
          ),
        ),

      ],
    );
  }
}
