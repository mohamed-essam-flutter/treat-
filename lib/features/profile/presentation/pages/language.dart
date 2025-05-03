import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treat/core/theme/styles.dart';
import 'package:treat/core/widgets/custom_app_bar.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  bool selectLanguage=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
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
                Text('Language'.tr(), style: TextStyles.font21PrimarySemiBold),
              ],
            ),
            SizedBox(height: 30.h,),
            InkWell(
              onTap: () {
                context.setLocale(Locale('en'));
                setState(() {
                  selectLanguage=true;
                });
              },
              child: Container(
                height: 62.h,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: selectLanguage?Color(0xff5EAF82):Color(0xFFE7E6E6)
                  ),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.w),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/english.svg'),
                      SizedBox(width: 10.w,),
                      Text('English',style: TextStyles.font16PrimaryMeduim.copyWith(
                        color:Color(0xff050505) 
                      ),
                      ),
                      Spacer(),
                      selectLanguage==true?
                      SvgPicture.asset('assets/icons/check.svg')
                      :SizedBox.shrink()
                    ],
                  ),
                ),
                
              ),
            ),
            SizedBox(height: 10.h,),
            InkWell(
              onTap: () {
                context.setLocale(Locale('ar'));
                setState(() {
                  selectLanguage=false;
                });
              },
              child: Container(
                height: 62.h,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: selectLanguage?Color(0xFFE7E6E6):Color(0xff5EAF82)
                  ),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.w),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/arabia.svg'),
                      SizedBox(width: 10.w,),
                      Text('عربى',style: TextStyles.font16PrimaryMeduim.copyWith(
                        color:Color(0xff050505) 
                      ),
                      ),
                      Spacer(),
                      selectLanguage==false?
                      SvgPicture.asset('assets/icons/check.svg')
                      :SizedBox.shrink()
                    ],
                  ),
                ),
                
              ),
            )
          ],
        ),
      ),
    );
  }
}
