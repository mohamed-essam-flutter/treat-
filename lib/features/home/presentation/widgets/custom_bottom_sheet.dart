import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:treat/core/theme/styles.dart';
import 'package:treat/core/utils/colors.dart';

void showAboutBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    // isScrollControlled: true, //  
    builder: (context) {
      return  Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: ColorsManager.scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'About'.tr(),
                style: TextStyles.font14PrimaryBold.copyWith(
                  color: Color(0xff222222)
                ),
              ),
              SizedBox(height: 10),
              Text(
                'is simply dummy text the printing and typesetting industrylorem Ipsum has been industry\'s standard dummy text ever since the 1500s when an unknown printer.',
                style: TextStyles.font14PrimaryRegular,
              ),
              SizedBox(height: 30),
              Text(
                'Opening Hours'.tr(),
                style: TextStyles.font14PrimaryBold.copyWith(
                  color: Color(0xff222222)
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount:5,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        // SvgPicture.asset('assets/icons/active.svg',width: 6.w,height: 6.h,),
                        // SizedBox(width: 5.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/active.svg',width: 6.w,height: 6.h,),
                                SizedBox(width: 5.w,),
                                Text('Monday -',style:TextStyles.font14PrimaryRegular,),
                                Text('Friday',style:TextStyles.font14PrimaryRegular,),
                              ],
                            ),
                                 Row(
                              children: [
                                SizedBox(width: 40.w,),
                                Text('08.00am -',style:TextStyles.font14PrimarySemiBold.copyWith(
                                  color: Color(0xff050505)
                                ),),
                                Text('03.00pm',style:TextStyles.font14PrimarySemiBold.copyWith(
                                  color: Color(0xff050505)
                                ),),
                              ],
                            )
                          ],
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
    },
  );
}