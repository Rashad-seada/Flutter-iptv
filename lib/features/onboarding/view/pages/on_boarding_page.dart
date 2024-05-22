import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_theme.dart';

import '../../../../core/views/widgets/space.dart';

class OnBoardingPage extends StatelessWidget {
  String image;
  String title;
  String description;

  OnBoardingPage({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: ListView(

        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Space(
              height: 12.h,
            ),
            Center(
              child: Center(
                  child: Image.asset(
                    image,
                    width: 86.w,
                    height: 30.h,
                  )),
            ),
            Space(
              height: 10.h,
            ),
            Center(
              child: Text(
                title,
                style: AppTheme.mainTextStyle(color: AppTheme.neutral300,fontSize: 20.sp,),
                textAlign: TextAlign.center,
              ).tr(),
            ),
            Space(
              height: 3.h,
            ),
            Center(
              child: Text(
                description,
                style: AppTheme.mainTextStyle(color: AppTheme.neutral500,fontSize: 12.sp),
                textAlign: TextAlign.center,
              ).tr(),
            )
          ]),
    );
  }
}
