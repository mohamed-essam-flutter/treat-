 import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treat/core/theme/styles.dart';
import 'package:treat/core/utils/colors.dart';
import 'package:treat/core/widgets/custom_app_bar.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({super.key});

  @override
  State<MyWalletScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<MyWalletScreen > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
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
                Text('My Wallet'.tr(), style: TextStyles.font21PrimarySemiBold),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: ColorsManager.brown
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment:Alignment.topRight ,
                    child: SvgPicture.asset('assets/icons/bx-wallet.svg',)),
                    Text('Your balance',style: TextStyles.font16PrimaryRegular.copyWith(
                      fontSize: 18.sp,
                      color:ColorsManager.white
                    ),),
                    Text('SR 500.00',style: TextStyles.font16PrimaryBold.copyWith(
                      fontSize: 32.sp,
                      color:ColorsManager.white
                    ),),
                ],
              ),
            )
           
          ],
        ),
      ),
    );
  }
}
