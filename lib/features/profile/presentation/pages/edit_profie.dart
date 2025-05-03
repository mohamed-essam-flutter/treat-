import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treat/core/theme/styles.dart';
import 'package:treat/core/widgets/app_text_form_field.dart';
import 'package:treat/core/widgets/custom_app_bar.dart';
import 'package:treat/core/widgets/custom_button.dart';
import 'package:treat/core/widgets/custom_icon.dart';
import 'package:treat/core/widgets/simple_dropdown.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? selectedValue;
  DateTime? selectedDate;
  TextEditingController dateController = TextEditingController();
   DateTime? _birthDate;
   String? _birthDateText;

     Future<void> _selectDate(BuildContext context) async {
     DateTime initialDate = DateTime(DateTime.now().year - 10);
    DateTime lastDate = DateTime(DateTime.now().year - 10, DateTime.now().month, DateTime.now().day);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: lastDate,
      builder: (BuildContext context, Widget? child) {
        return Localizations.override(
          context: context,
          //check if the locale is supported
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Theme.of(context).primaryColor,
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColor,
                ),
              ),
            ),
            child: child!,
          ),
        );
      },
    );

    if (picked != null && picked != _birthDate) {
      setState(() {
        _birthDate = picked;
        _birthDateText = DateFormat(
          'yyyy-MM-dd',
          'en',
        ).format(picked); // تنسيق إنجليزي
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
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
                  Text('Edit Profile'.tr(),
                      style: TextStyles.font21PrimarySemiBold),
                ],
              ),
              SizedBox(
                height: 18.h,
              ),
              Text('Name'.tr(), style: TextStyles.font14PrimarySemiBold),
              SizedBox(height: 2.h),
              AppTextFormField(
                hintText: 'Jhon Doe'.tr(),
                validator: (p0) {},
                suffixIcon: CustomIcon(imagePath: 'assets/icons/person.svg'),
              ),
              SizedBox(height: 18.h),
              Text('Phone Number'.tr(),
                  style: TextStyles.font14PrimarySemiBold),
              SizedBox(height: 2.h),
              AppTextFormField(
                hintText: '444422211'.tr(),
                validator: (p0) {},
                suffixIcon: CustomIcon(imagePath: 'assets/icons/phone.svg'),
              ),
              SizedBox(height: 18.h),
              Text('E-mail'.tr(), style: TextStyles.font14PrimarySemiBold),
              SizedBox(height: 2.h),
              AppTextFormField(
                hintText: 'Jhondoe@company.com'.tr(),
                validator: (p0) {},
                suffixIcon: CustomIcon(imagePath: 'assets/icons/mail.svg'),
              ),
              SizedBox(height: 18.h),
              Text('Gender'.tr(), style: TextStyles.font14PrimarySemiBold),
              SizedBox(height: 2.h),
              CustomDropdownButtonFormField<String>(
                showLabel: false,
                value: selectedValue,
                items: [
                  DropdownMenuItem(
                      value: "Male".tr(), child: Text("Male".tr())),
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
              SizedBox(
                height: 18.h,
              ),
              Text('Date of birth'.tr(),
                  style: TextStyles.font14PrimarySemiBold),
              SizedBox(height: 2.h),
              GestureDetector(
                 onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: AppTextFormField(
                    controller: TextEditingController(
                      text: _birthDateText
                    ),
                    readOnly: true,
                    hintText: '4/26/1980'.tr(),
                    validator: (p0) {},
                    suffixIcon: CustomIcon(imagePath: 'assets/icons/date.svg'),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              CustomButton(lable: 'update', onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
