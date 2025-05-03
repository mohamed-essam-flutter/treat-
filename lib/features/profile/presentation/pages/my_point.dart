import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treat/core/theme/styles.dart';
import 'package:treat/core/utils/colors.dart';
import 'package:treat/core/widgets/custom_app_bar.dart';

class MyPointScreen extends StatefulWidget {
  const MyPointScreen({super.key});

  @override
  State<MyPointScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<MyPointScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                context.locale.languageCode == 'en'
                    ? SvgPicture.asset(
                      'assets/icons/Back.svg',
                      width: 21.w,
                      height: 19.h,
                    )
                    : RotatedBox(
                      quarterTurns: 2,
                      child: SvgPicture.asset(
                        'assets/icons/Back.svg',
                        width: 21.w,
                        height: 19.h,
                      ),
                    ),
                Spacer(),
                Text('My Point'.tr(), style: TextStyles.font21PrimarySemiBold),
              ],
            ),
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: ColorsManager.primary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset(
                      'assets/icons/point.svg',
                      color: ColorsManager.white,
                    ),
                  ),
                  Text(
                    'Your Points'.tr(),
                    style: TextStyles.font16PrimaryRegular.copyWith(
                      fontSize: 18.sp,
                      color: ColorsManager.white,
                    ),
                  ),
                  Text(
                    '500 Points',
                    style: TextStyles.font16PrimaryBold.copyWith(
                      fontSize: 32.sp,
                      color: ColorsManager.white,
                    ),
                  ),
                  Text(
                    'Latest update 22 July 2023',
                    style: TextStyles.font14PrimaryRegular.copyWith(
                      color: ColorsManager.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Text(
                  'Point History'.tr(),
                  style: TextStyles.font14PrimaryBold.copyWith(
                    color: Color(0xff222222),
                  ),
                ),
                Spacer(),
                Text(
                  '"5 Results"'.tr(),
                  style: TextStyles.font14PrimaryRegular.copyWith(
                    color: Color(0xff222222),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 80.h,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '22 July 2023 , 09.00am',
                                style: TextStyles.font12PrimaryRegular.copyWith(
                                  color: Color(0xffAFAFAF),
                                ),
                              ),
                              Spacer(),
                              Text(
                                '#45545'.tr(),
                                style: TextStyles.font14PrimaryRegular.copyWith(
                                  color: Color(0xffAFAFAF),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Text(
                                'Payment SR 50',
                                style: TextStyles.font14PrimaryRegular.copyWith(
                                  color: Color(0xff050505),
                                ),
                              ),
                              Spacer(),
                              Text(
                                '+100'.tr(),
                                style: TextStyles.font14PrimarySemiBold.copyWith(
                                  color: ColorsManager.brown,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
