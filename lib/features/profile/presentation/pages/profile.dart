import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treat/core/routes/routes_manager.dart';
import 'package:treat/core/theme/styles.dart';
import 'package:treat/core/utils/colors.dart';
import 'package:treat/core/widgets/custom_icon.dart';
import 'package:treat/features/profile/presentation/widgets/custom_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
          SizedBox(width: 15.w),   
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
                Text('My Account', style: TextStyles.font21PrimarySemiBold),
              ],
            ),
            SizedBox(height: 20.h,),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesManager.editProfileScreen);
              },
              child: CustomCardScreen(icon: 'assets/icons/profile.svg',name: 'Profile'.tr(),)),
            SizedBox(height: 8.h,),
            Divider(thickness:1 ,),
            SizedBox(height: 8.h,),
            GestureDetector(
               onTap: () {
                Navigator.pushNamed(context, RoutesManager.myPointScreen);
              },
              child: CustomCardScreen(icon: 'assets/icons/point.svg',name: 'My Points'.tr(),)),
            SizedBox(height: 8.h,),
            Divider(thickness:1 ,),
            SizedBox(height: 8.h,),
            GestureDetector(
               onTap: () {
                Navigator.pushNamed(context, RoutesManager.myWalletScreen);
              },
              child: CustomCardScreen(icon: 'assets/icons/wallet.svg',name: 'My Wallet'.tr(),)),
            SizedBox(height: 8.h,),
            Divider(thickness:1 ,),
            SizedBox(height: 8.h,),
            CustomCardScreen(icon: 'assets/icons/share.svg',name: 'Share'.tr(),),
            SizedBox(height: 8.h,),
            Divider(thickness:1 ,),
            SizedBox(height: 8.h,),
            CustomCardScreen(icon: 'assets/icons/star.svg',name: 'Rate App'.tr(),),
            SizedBox(height: 8.h,),
            Divider(thickness:1 ,), 
            SizedBox(height: 8.h,),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesManager.settingScreen);
              },
              child: CustomCardScreen(icon: 'assets/icons/settings.svg',name: 'Settings'.tr(),)),
            SizedBox(height: 8.h,),
            Divider(thickness:1 ,),
            SizedBox(height: 8.h,),
            CustomCardScreen(icon: 'assets/icons/log-out.svg',name: 'Logout'.tr(),iconColor: ColorsManager.errorColor,textColor: ColorsManager.errorColor, ),
          ],
        ),
      ),
    );
  }
}
