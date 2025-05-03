import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treat/core/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}