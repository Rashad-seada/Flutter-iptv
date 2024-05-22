
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_theme.dart';
import '../../../core/views/widgets/space.dart';
import '../utils/pages.dart';

// ignore: must_be_immutable
class CustomNavBar extends StatelessWidget {
  List<PageModel> items = [];
  int selectedIndex;
  void Function(int)? onTap;

  CustomNavBar(
      {super.key,
      required this.items,
      this.onTap,
      required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      width: double.infinity,
      height: 9.h,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ], color: AppTheme.tritory),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
            items.length,
            (index) => InkWell(
                onTap: () {
                  if (onTap != null) {
                    onTap!(index);
                  }
                },
                child: CustomNavItem(items[index], selectedIndex == index))),
      ),
    );
  }
}

Widget CustomNavItem(PageModel page, bool isSelected) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        page.icon,
        size: 7.w,
        color: (isSelected) ? AppTheme.primary : AppTheme.neutral400,
      ),

      Space(
        height: .5.h,
      ),
      Text(
        page.title,
        style: AppTheme.mainTextStyle(
          color: (isSelected) ? AppTheme.primary : AppTheme.neutral400,
          fontSize: 10.sp,
        ),
      ),
    ],
  );
}
