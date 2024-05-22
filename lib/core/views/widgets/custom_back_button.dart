import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/generated/locale_keys.g.dart';
import '../../config/app_images.dart';
import '../../config/app_theme.dart';

class CustomBackButton extends StatelessWidget {
  void Function()? onPressed;

  CustomBackButton({super.key,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
            borderRadius: BorderRadius.circular(100.w),
            onTap: () {
              if(onPressed != null){
                onPressed!();
              }
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(3.w),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppTheme.neutral900,
                shape: BoxShape.circle
              ),
              child: SvgPicture.asset(AppImages.arrow,
                width: 6.w
                ,height: 6.w,
                color: AppTheme.neutral100,
              ),
            )
        ),

        Center(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "HULK",
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral100, fontSize: 18.sp),
              ).tr(),

              Text(
                " iptv",
                style: AppTheme.mainTextStyle(
                    color: AppTheme.primary, fontSize: 13.sp),
              ).tr()
            ],
          ),
        ),

      ],
    );
  }
}
