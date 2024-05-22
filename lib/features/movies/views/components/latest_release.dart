import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/views/widgets/space.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_network_image.dart';

class LatestRelease extends StatelessWidget {
  const LatestRelease({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(left: 2.w),

      shrinkWrap: true,
      children: [

        Text(
          "Latest Release",
          style: AppTheme.mainTextStyle(
              color: AppTheme.neutral300, fontSize: 10.sp),
        ).tr(),

        Space(height: 1.h,),

        SizedBox(
          height: 17.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return card();

            },
            separatorBuilder: (BuildContext context, int index) {
              return Space(width: 2.w,);


            }, itemCount: 10,

          ),
        )
      ],
    );
  }
}

Widget card() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(1.w),
    child: CustomNetworkImage(

      height: 17.h,
      width: 28.w,
      fit: BoxFit.cover,
      url: "https://cdn.cinematerial.com/p/297x/z59mbbol/an-affair-to-forget-philippine-movie-poster-md.jpg?v=1674884539",
    ),
  );
}
