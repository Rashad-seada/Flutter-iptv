import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_theme.dart';

import '../../../../core/views/widgets/custom_network_image.dart';


class AdBanner extends StatelessWidget {
  const AdBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        color: AppTheme.tritory,
        borderRadius: BorderRadius.circular(2.w)
      ),
      child: CustomNetworkImage(
        height: 30.h,
        fit: BoxFit.fitHeight,
        url: "https://ntvb.tmsimg.com/assets/p12460960_v_h8_an.jpg?w=960&h=540",
      ),

    );
  }
}
