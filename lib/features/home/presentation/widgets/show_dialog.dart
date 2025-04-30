import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treat/core/theme/styles.dart';
import 'package:treat/core/widgets/app_text_form_field.dart';
import 'package:treat/core/widgets/custom_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationDialog extends StatelessWidget {
  const LocationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Please_select_your_location_to'.tr(),
                style: TextStyles.font16PrimaryBold.copyWith(fontSize: 16.sp),
              ),
              Text(
                'ensure_service_coverage'.tr(),
                style: TextStyles.font16PrimaryBold.copyWith(fontSize: 16.sp),
              ),
              SizedBox(height: 20.h),
              AppTextFormField(
                borderSideColor: Color(0xffE0E0E0),
                backgroundColor: Colors.white,
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/icons/search.svg'),
                ),
                hintText: 'What are you looking for?'.tr(),
                validator: (p) {},
              ),
              SizedBox(height: 20.h),
              Container(
                height: 310.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(
                    color: Color(0xffE0E0E0),
                    width: 1.5,
                  ),
                ),
                child: CupertinoScrollbar(
                  thumbVisibility: true,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.grey[300],
                      );
                    },
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'Damietta',
                            style: TextStyles.font16PrimarySemiBold,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              CustomButton(
                lable: 'set location'.tr(),
                onTap: () {
                  Navigator.pop(context); // لإغلاق الـ Dialog بعد تحديد الموقع
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


