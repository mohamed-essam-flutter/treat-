import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treat/core/routes/routes_manager.dart';
import 'package:treat/core/theme/styles.dart';
import 'package:treat/core/utils/colors.dart';
import 'package:treat/core/widgets/confirm_pop.dart';
import 'package:treat/core/widgets/custom_app_bar.dart';
import 'package:treat/features/profile/presentation/widgets/custom_card.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
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
                Text('My Account'.tr(), style: TextStyles.font21PrimarySemiBold),
              ],
            ),
            SizedBox(height: 20.h,),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesManager.changeLanguageScreen);
              },
              child: CustomCardScreen(icon: 'assets/icons/langauge.svg',name: 'Langauge'.tr(),)),
            SizedBox(height: 8.h,),
            Divider(thickness:1 ,),
            SizedBox(height: 8.h,),
            CustomCardScreen(icon: 'assets/icons/location.svg',name: 'Location'.tr(),),
            SizedBox(height: 8.h,),
            Divider(thickness:1 ,),
            SizedBox(height: 8.h,),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesManager.faqsScreen);
              },
              child: CustomCardScreen(icon: 'assets/icons/faq.svg',name: 'Faqs'.tr(),)),
            SizedBox(height: 8.h,),
            Divider(thickness:1 ,),
            SizedBox(height: 8.h,),
            GestureDetector(
               onTap: () {
                Navigator.pushNamed(context, RoutesManager.contactUsScreen);
              },
              child: CustomCardScreen(icon: 'assets/icons/phone_me.svg',name: 'Contact Us'.tr(),)),
            SizedBox(height: 8.h,),
            Divider(thickness:1 ,),
            SizedBox(height: 8.h,),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesManager.termsScreen);
              },
              child: CustomCardScreen(icon: 'assets/icons/terms.svg',name: 'Terms & Conditions'.tr())),
            SizedBox(height: 8.h,),
            Divider(thickness:1 ,),
            SizedBox(height: 8.h,),
            GestureDetector(
                onTap: () {
                Navigator.pushNamed(context, RoutesManager.privacyPolicyScreen);
              },
              child: CustomCardScreen(icon: 'assets/icons/terms.svg',name: 'Privacy Policy'.tr())),
            SizedBox(height: 8.h,),
            Divider(thickness:1 ,),
            SizedBox(height: 8.h,),
            GestureDetector(
                onTap: () {
                Navigator.pushNamed(context, RoutesManager.refundPolicyScreen);
              },
              child: CustomCardScreen(icon: 'assets/icons/terms.svg',name: 'Refund Policy'.tr())),
            SizedBox(height: 8.h,),
            Divider(thickness:1 ,),
            SizedBox(height: 8.h,),
            GestureDetector(
              onTap: () {
                showDialog(context: context,
                 builder: (context) => ConfirmCancelPopUp(title: 'You want to cancel ?',
                  confirmText: 'Yes',onConfirm: () {
                   
                 },),);
              },
              child: CustomCardScreen(icon: 'assets/icons/delete.svg',name: 'Delete Account'.tr(),iconColor: ColorsManager.errorColor,textColor: ColorsManager.errorColor,)),
          ],
        ),
      ),
    );
  }
}


