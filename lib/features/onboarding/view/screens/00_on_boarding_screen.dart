import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/features/onboarding/view/bloc/on_boarding_cubit.dart';
import 'package:smart_soft/generated/locale_keys.g.dart';
import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_page_indicator.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../pages/on_boarding_page.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [

            Positioned(
              right: 7.w,
              top: 4.h,
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
            ),

            SizedBox(
              child: PageView(
                controller: context.read<OnBoardingCubit>().controller,
                onPageChanged: context.read<OnBoardingCubit>().onPageChanged,
                children: [

                  OnBoardingPage(
                    image: AppImages.onBoardingImage1,
                    title: LocaleKeys.on_boarding_title_1,
                    description: LocaleKeys.on_boarding_description_1,
                  ),

                  OnBoardingPage(
                    image: AppImages.onBoardingImage2,
                    title: LocaleKeys.on_boarding_title_2,
                    description: LocaleKeys.on_boarding_description_2,
                  ),

                  OnBoardingPage(
                    image: AppImages.onBoardingImage3,
                    title: LocaleKeys.on_boarding_title_3,
                    description: LocaleKeys.on_boarding_description_3,
                  ),

                ],
              ),
            ),

            Positioned(
                bottom: 50.h,
                child: BlocConsumer<OnBoardingCubit, OnBoardingState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return CustomPageIndicator(
                      index: context.read<OnBoardingCubit>().index,
                    );
                  },
                )
            ),

            Positioned(
              bottom: 17.h,
              child: BlocConsumer<OnBoardingCubit, OnBoardingState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return MainButton(
                    color: AppTheme.primary,
                    width: 86.w,
                    height: 6.h,
                    label: Text(
                      LocaleKeys.next,
                      style: AppTheme.mainTextStyle(
                          color: AppTheme.neutral100, fontSize: 12.sp),
                    ).tr(),
                    onTap: ()=> context.read<OnBoardingCubit>().onNextClick(context),
                  );
                },
              ),
            ),

            Positioned(
              bottom: 10.h,
              child: GestureDetector(
                onTap: ()=> context.read<OnBoardingCubit>().onSkipCLick(context),
                child: Text(
                  LocaleKeys.skip,
                  style: AppTheme.mainTextStyle(
                      color: AppTheme.neutral500, fontSize: 15.sp),
                ).tr(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
