import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:treat/core/routes/routes_manager.dart';
import 'package:treat/core/theme/styles.dart';
import 'package:treat/core/utils/colors.dart';
import 'package:treat/core/widgets/custom_button.dart';
import 'package:treat/core/widgets/custom_icon.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  Timer? _timer;
  int _counter = 60;

  @override
  void initState() {
    super.initState();
    _setTimer();
  }

  _setTimer() {
    _timer?.cancel();
    _counter = 60;
    if (mounted) setState(() {});

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_counter > 0) _counter--;
      if (mounted) setState(() {});
    });
  }

  Widget showRsendText() {
    if (_counter == 0) {
      return Center(
        child: TextButton(
          onPressed: () {},
          child: Text(
            'Resend_code'.tr(),
            style: TextStyles.font16PrimarySemiBold.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomIcon(
          imagePath: 'assets/icons/Logo.svg',
          isColorContainer: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.051),
            Text(tr('otp_verification'), style: TextStyles.font26PrimaryBold),
            SizedBox(height: 20),
            Text(
              'need_otp_verification'.tr(),
              style: TextStyles.font16PrimaryRegular,
              maxLines: 2,
            ),
            SizedBox(height: 40.h),
            Text("Code".tr(), style: TextStyles.font14PrimarySemiBold),
            SizedBox(height: 7.h),
            PinCodeTextField(
              appContext: context,
              length: 4,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(16.r),
                fieldHeight: 80.h,
                fieldWidth: 80.w,
                inactiveFillColor: ColorsManager.white,
                activeFillColor: ColorsManager.white,
                selectedFillColor: ColorsManager.white,
                inactiveColor: ColorsManager.white.withOpacity(0.5),
                selectedColor: ColorsManager.white.withOpacity(0.5),
                activeColor: ColorsManager.white.withOpacity(0.5),
              ),
              cursorColor: ColorsManager.primaryColor,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              onCompleted: (v) {},
              onChanged: (value) {},
              textStyle: TextStyles.font32PrimarySemiBold,
            ),
            SizedBox(height: 80.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Expires_in'.tr(), style: TextStyles.font16PrimaryRegular),
                SizedBox(width: 7.w),
                Text(
                  '${_counter}s',
                  style: TextStyles.font26PrimaryBold.copyWith(fontSize: 20.sp),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            showRsendText(),
            const Spacer(),
            CustomButton(
              lable: tr('Confirm'),
              onTap: () {
                Navigator.pushNamed(context, RoutesManager.register);
              },
            ),
            SizedBox(height: 12.h),         
            SafeArea(
              top: false,
              child: CustomButton(
                lable: tr('back'),
                onTap: () {
                  Navigator.pop(context);
                },
                backgroundColor: Color(0xffF6F6F6),
                textColor: ColorsManager.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
