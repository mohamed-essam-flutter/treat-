import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treat/core/theme/styles.dart';
import 'package:treat/core/utils/colors.dart';
import 'package:treat/core/widgets/custom_app_bar.dart';
import 'package:treat/core/widgets/custom_button.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
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
                Text('Contact us'.tr(), style: TextStyles.font21PrimarySemiBold),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(lable:'WHATSAPP CHAT'.tr() , onTap: (){},iconText: true,nameIconButton: 'assets/icons/whatsapp.svg',),
            SizedBox(height: 10.h,),
            CustomButton(lable:'EMAIL US'.tr() , onTap: (){},iconText: true,nameIconButton: 'assets/icons/mail.svg',
            backgroundColor: ColorsManager.scaffoldBackgroundColor,textColor:ColorsManager.primary,borderColor:ColorsManager.primary ,)
           
          ],
        ),
      ),
    );
  }
}