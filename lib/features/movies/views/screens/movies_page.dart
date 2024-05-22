import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/views/widgets/space.dart';

import '../../../../core/config/app_theme.dart';
import '../components/ad_banner.dart';
import '../components/continue_watching.dart';
import '../components/latest_release.dart';
import '../components/movies_slider.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor : AppTheme.secondary,
            title: Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "HULK",
                  style: AppTheme.mainTextStyle(
                      color: AppTheme.neutral100, fontSize: 20.sp),
                ),

                Text(
                  " IPTV",
                  style: AppTheme.mainTextStyle(
                      color: AppTheme.primary, fontSize: 12.sp),
                )
              ],
            ),
          ),),
          body: ListView(
            shrinkWrap: true,
            children: [

              Space(height: 1.h,),

              MoviesSlider(),

              Space(height: 2.h,),

              ContinueWatching(),

              Space(height: 3.h,),

              LatestRelease(),

              Space(height: 1.h,),

              AdBanner()

            ],
          ),
    ));
  }
}
