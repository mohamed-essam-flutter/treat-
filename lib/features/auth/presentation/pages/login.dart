import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treat/core/theme/font_weight_helper.dart';
import 'package:treat/core/theme/styles.dart';
import 'package:treat/core/utils/colors.dart';
import 'package:treat/core/utils/dimensions.dart';
import 'package:treat/core/widgets/app_text_form_field.dart';
import 'package:treat/core/widgets/custom_button.dart';
import 'package:treat/core/widgets/custom_icon.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            Dimensions.PADDING_SIZE_VERTICAL_EXTRA_LARGE,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.25),
              Center(
                child: SvgPicture.asset(
                  'assets/icons/Logo.svg',
                  width: 46.w,
                  height: 54.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 70.h),
              Text(
                'phone_number'.tr(),
                style: TextStyles.font14mediumGreenSemiBold,
              ),
              SizedBox(height: 5.h),
              SizedBox(
                height: 60.h,
                child: AppTextFormField(
                  hintText: "5555 444 33",
                  validator: (p) {},
                  suffixIcon: CustomIcon(imagePath: 'assets/icons/phone.svg',),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: checkBoxValue,
                    onChanged: (value) {
                      setState(() {
                        checkBoxValue = value!;
                      });
                    },
                    activeColor: Color(0xff5EAF82),
                  ),
                  Text(
                    tr('read_agreement'),
                    style: TextStyles.font14LightGreenRegular,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      tr('terms_of_use'),
                      style: TextStyles.font14mediumGreenSemiBold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60.h),
              CustomButton(lable: tr('Next'),onTap: (){
                Navigator.pushNamed(context, '/otp');
              } ,),
              SizedBox(height: 34.h),
              Center(
                child: Text(
                  tr('Login_as_a_Guest'),
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeightHelper.bold,
                    color: ColorsManager.mediumGreen,
                    decoration:TextDecoration.underline, 
                    decorationThickness: 4,
                    decorationColor: ColorsManager.darkGreen,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
