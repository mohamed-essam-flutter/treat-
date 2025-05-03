import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:treat/core/theme/styles.dart';
import 'package:treat/core/utils/colors.dart';
import 'package:treat/core/widgets/app_text_form_field.dart';
import 'package:treat/core/widgets/custom_button.dart';
import 'package:treat/core/widgets/custom_icon.dart';
import 'package:treat/core/widgets/simple_dropdown.dart';
import 'package:treat/features/location/presentation/pages/map_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? selectedValue;
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.051),
            Text(
              tr('Complete_your_Information'),
              style: TextStyles.font26PrimaryBold.copyWith(fontSize: 23.sp),
              maxLines: 1,
            ),
            SizedBox(height: 70.h),
            Text('Name'.tr(), style: TextStyles.font14PrimarySemiBold),
            SizedBox(height: 2.h),
            AppTextFormField(
              hintText: 'Jhon Doe'.tr(),
              validator: (p0) {},
              suffixIcon: CustomIcon(imagePath: 'assets/icons/person.svg'),
            ),
            SizedBox(height: 35.h),
            Text('Gender'.tr(), style: TextStyles.font14PrimarySemiBold),
            SizedBox(height: 2.h),
            CustomDropdownButtonFormField<String>(
              showLabel: false,
              value: selectedValue,
              items: [
                DropdownMenuItem(value: "Male".tr(), child: Text("Male".tr())),
                DropdownMenuItem(
                  value: 'Female'.tr(),
                  child: Text('Female'.tr()),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
              hintText: 'Select_Gender'.tr(),
              textStyle: TextStyles.font14DarkBlueMedium,
            ),
            const Spacer(),
            CustomButton(
              lable: tr('Confirm'),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      // height: MediaQuery.of(context).size.height * 0.3999, 
                      width: MediaQuery.of(context).size.width,
                      color: ColorsManager.scaffoldBackgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional.topEnd,
                              child: InkWell(
                                onTap: () => Navigator.pop(context),
                                child: Icon(
                                  Icons.close,
                                  color: ColorsManager.gray,
                                  size: 25.h,
                                  textDirection: ui.TextDirection.rtl,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.location_on_outlined,
                              color: ColorsManager.gray,
                              size: 60.h,
                              textDirection: ui.TextDirection.rtl,
                            ),
                            SizedBox(height: 9.h),
                            Text(
                              "We need access to location".tr(),
                              style: TextStyles.font16PrimarySemiBold.copyWith(
                                fontSize: 20.sp,
                              ),
                            ),
                            SizedBox(height: 11.h),
                            Text(
                              "We need access to location subtitle".tr(),
                              style: TextStyles.font16PrimaryRegular.copyWith(
                                color: ColorsManager.gray,
                              ),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 25.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButton(
                                  lable: 'Deny'.tr(),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder:
                                            (_) => MapScreen(
                                                  forcedLocation: LatLng(25.00000000,45.00000000),
                                            ),
                                      ),
                                    );
                                  },
                                  width: MediaQuery.sizeOf(context).width * 0.4,
                                  backgroundColor:
                                      ColorsManager.scaffoldBackgroundColor,
                                  borderColor: Color(0xffBABABA),
                                  textColor: Color(0xffBABABA),
                                ),
                                SizedBox(width: 10.w),
                                CustomButton(
                                  lable: 'Allow'.tr(),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (_) => MapScreen(),
                                      ),
                                    );
                                  },
                                  width: MediaQuery.sizeOf(context).width * 0.4,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(height: 12.h),
            CustomButton(
              borderColor: ColorsManager.primary,
              lable: tr('back'),
              onTap: () {
                Navigator.pop(context);
              },
              backgroundColor: Color(0xffF6F6F6),
              textColor: ColorsManager.primary,
            ),
            SizedBox(height: 12.h), 
          ],
        ),
      ),
    );
  }
}
