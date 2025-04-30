import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treat/core/utils/colors.dart';
import 'package:treat/core/widgets/app_text_form_field.dart';
import 'package:treat/core/widgets/custom_button.dart';
import 'package:treat/core/widgets/custom_icon.dart';
import 'package:treat/features/home/presentation/widgets/banner.dart';
import 'package:treat/features/home/presentation/widgets/custom_tabs.dart';
import 'package:treat/features/home/presentation/widgets/show_botton_sheet.dart';
import 'package:treat/features/home/presentation/widgets/show_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLocationTab = true;
  bool colorButton = true;
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
          SizedBox(width: 5.w),
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
          children: [
            Row(
              children: [
                Expanded(
                  child: AppTextFormField(
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/icons/search.svg'),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
                        showBottomSheet(
                          context: context,
                          builder: (context) {
                           return ShowBottonSheet();
                          },
                        );
                      },
                      icon: SvgPicture.asset('assets/icons/filter.svg'),
                    ),
                    hintText: 'What are you looking for?'.tr(),
                    validator: (p) {},
                  ),
                ),
                SizedBox(width: 10.w), // Add some spacing
                Container(
                  height: 57.h,
                  width: 57.w,
                  decoration: BoxDecoration(
                    color: ColorsManager.primary,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/bx-map-alt.svg',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            HomeBanner(image: 'https://cdn.pixabay.com/photo/2025/04/16/06/25/penguin-9536897_1280.jpg',itemCount: 3,),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  height: 45.h,
                  lable: 'Location'.tr(),
                  onTap: () {
                    setState(() {
                      colorButton = true;
                      isLocationTab = true;
                    });
                  },
                  width: MediaQuery.sizeOf(context).width * 0.35,
                  backgroundColor:
                      colorButton == true
                          ? ColorsManager.primary
                          : ColorsManager
                              .scaffoldBackgroundColor, //ColorsManager.primary
                  borderColor:
                      colorButton == true
                          ? ColorsManager.scaffoldBackgroundColor
                          : Color(
                            0xffBABABA,
                          ), //ColorsManager.scaffoldBackgroundColor
                  textColor:
                      colorButton == true
                          ? ColorsManager.scaffoldBackgroundColor
                          : Color(
                            0xffBABABA,
                          ), //ColorsManager.scaffoldBackgroundColor
                ),
                SizedBox(width: 10.w),
                CustomButton(
                  height: 45.h,
                  lable: 'Home'.tr(),
                  onTap: () {
                    setState(() {
                      colorButton = false;
                      isLocationTab = false;
                    });
                    showDialog(
                      context: context,
                      builder: (context) => LocationDialog(),
                    );
                  },
                  width: MediaQuery.sizeOf(context).width * 0.35,
                  backgroundColor:
                      colorButton == false
                          ? ColorsManager.primary
                          : ColorsManager
                              .scaffoldBackgroundColor, //ColorsManager.primary
                  borderColor:
                      colorButton == false
                          ? ColorsManager.scaffoldBackgroundColor
                          : Color(
                            0xffBABABA,
                          ), //ColorsManager.scaffoldBackgroundColor
                  textColor:
                      colorButton == false
                          ? ColorsManager.scaffoldBackgroundColor
                          : Color(0xffBABABA),
                ),
              ],
            ),
            Expanded(child: CategoryTabs(isLocationTab: isLocationTab)),
          ],
        ),
      ),
    );
  }
}
