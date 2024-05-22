import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/views/widgets/space.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_network_image.dart';

class ContinueWatching extends StatelessWidget {
  const ContinueWatching({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(left: 2.w),

      shrinkWrap: true,
      children: [

        Text(
          "Continue watching",
          style: AppTheme.mainTextStyle(
              color: AppTheme.neutral300, fontSize: 10.sp),
        ).tr(),

        Space(height: 1.h,),

        SizedBox(
          height: 12.h,
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
    child: Stack(

      alignment: Alignment.bottomLeft,
      children: [
        CustomNetworkImage(
          height: 12.h,
          width: 40.w,
          fit: BoxFit.fitHeight,
          url: "https://i0.wp.com/4.bp.blogspot.com/_o31CLSHm6KA/TA8B1mNMn7I/AAAAAAAAAFE/Se2ZAnqpdEo/s1600/Inception+banner+2.jpg",
        ),

        Padding(
          padding: const EdgeInsets.all(5),
          child: CircleAvatar(
            radius: 3.w,
            child: Icon(
              size: 5.w,
              Icons.play_arrow
            ),
          ),
        )


      ],
    ),
  );
}
