import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treat/core/theme/styles.dart';
import 'package:treat/core/widgets/custom_app_bar.dart';

class RefundPolicyScreen extends StatefulWidget {
  const RefundPolicyScreen({super.key});

  @override
  State<RefundPolicyScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<RefundPolicyScreen> {
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
                Text('Refund Policy'.tr(), style: TextStyles.font21PrimarySemiBold),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(child: Text('ssssssssssdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddssssssss',style: TextStyles.font16PrimaryRegular,))
          ],
        ),
      ),
    );
  }
}
