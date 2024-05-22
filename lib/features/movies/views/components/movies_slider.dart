import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_theme.dart';
import 'package:smart_soft/core/views/widgets/custom_network_image.dart';
import 'package:smart_soft/core/views/widgets/space.dart';

import '../../../../core/views/widgets/custom_page_indicator.dart';
import '../../../../core/views/widgets/main_button.dart';

class MoviesSlider extends StatelessWidget {
  const MoviesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppTheme.tritory,
          height: 30.h,
          child: PageView(

            children: [

              adImage(),

              adImage(),

            ],
          ),
        ),

        Space(height: 1.h,),

        CustomPageIndicator(count: 10,)
      ],
    );
  }
}

Widget adImage(){
  return Stack(
    alignment: Alignment.bottomCenter,
    children: [
      CustomNetworkImage(
          height: 30.h,
          fit: BoxFit.fitHeight,
        url: "https://samfillingham.com/wp-content/uploads/2020/05/2200-1000px-banner-Muna-1310x595.jpg",
      ),

      Padding(
        padding: EdgeInsets.only(bottom: 2.5.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MainButton(
              color: AppTheme.neutral100,
              width: 47.w,
              height: 4.7.h,
              label: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.play_arrow),
                  Space(width: 3.w,),
                  Text(
                    "Subscribe to Watch",
                    style: AppTheme.mainTextStyle(
                      fontWeight: FontWeight.w600,
                    color: AppTheme.neutral900, fontSize: 8.sp),
                  ).tr(),
                ],
              ),
              onTap: ()=> {},
            ),
            Space(width: 3.w,),

            MainButton(
              color: AppTheme.neutral100,
              width: 5.h,
              height: 4.7.h,
              label: Icon(Icons.add),

              onTap: ()=> {},
            ),

          ],
        ),
      )
    ],
  );
}
