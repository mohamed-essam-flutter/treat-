import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treat/core/theme/styles.dart';
import 'package:treat/core/utils/colors.dart';
import 'package:treat/core/widgets/custom_icon.dart';
import 'package:treat/features/profile/presentation/widgets/custom_card.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(horizontal: 30),
        actions: [
          SvgPicture.asset(
            'assets/icons/location.svg',
            width: 20.w,
            height: 20.h,
          ),
          SizedBox(width: 5.w),
          Stack(
            clipBehavior: Clip.none,
            children: [
              SvgPicture.asset(
                'assets/icons/notification.svg',
                width: 20.w,
                height: 20.h,
              ),
              Positioned(
                right: -5,
                top: -5,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Color(0XFFB2866B),
                    shape: BoxShape.circle,
                  ),
                  constraints: BoxConstraints(minWidth: 16, minHeight: 16),
                  child: Text(
                    '3',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
        leading: CustomIcon(
          imagePath: 'assets/icons/Logo.svg',
          isColorContainer: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/Back.svg',
                  width: 21.w,
                  height: 19.h,
                ),
                Spacer(),
                Text('My Account', style: TextStyles.font21PrimarySemiBold),
              ],
            ),
            SizedBox(height: 20.h,),
            CustomCardScreen(icon: 'assets/icons/langauge.svg',name: 'Langauge'.tr(),),
            SizedBox(height: 8.h,),
            Divider(thickness:1 ,),
            SizedBox(height: 8.h,),
            CustomCardScreen(icon: 'assets/icons/location.svg',name: 'Location'.tr(),),
            SizedBox(height: 8.h,),
            Divider(thickness:1 ,),
            SizedBox(height: 8.h,),
            CustomCardScreen(icon: 'assets/icons/faq.svg',name: 'Faqs'.tr(),),
            SizedBox(height: 8.h,),
            Divider(thickness:1 ,),
            SizedBox(height: 8.h,),
            CustomCardScreen(icon: 'assets/icons/phone_me.svg',name: 'Contact Us'.tr(),),
            SizedBox(height: 8.h,),
            Divider(thickness:1 ,),
            SizedBox(height: 8.h,),
            CustomCardScreen(icon: 'assets/icons/terms.svg',name: 'Terms & Conditions'.tr()),
            SizedBox(height: 8.h,),
            Divider(thickness:1 ,),
            SizedBox(height: 8.h,),
            CustomCardScreen(icon: 'assets/icons/terms.svg',name: 'Privacy Policy'.tr()),
            SizedBox(height: 8.h,),
            Divider(thickness:1 ,),
            SizedBox(height: 8.h,),
            CustomCardScreen(icon: 'assets/icons/terms.svg',name: 'Refund Policy'.tr()),
            SizedBox(height: 8.h,),
            Divider(thickness:1 ,),
            SizedBox(height: 8.h,),
            CustomCardScreen(icon: 'assets/icons/delete.svg',name: 'Delete Account'.tr(),iconColor: ColorsManager.errorColor,textColor: ColorsManager.errorColor,),
          ],
        ),
      ),
    );
  }
}
