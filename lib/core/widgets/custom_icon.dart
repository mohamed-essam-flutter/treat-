import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treat/core/utils/colors.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.imagePath, this.isColorContainer = true,  this.widthImage,  this.heightImage});
  final String imagePath;
  final bool isColorContainer;
  final double? widthImage;
  final double? heightImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.r),
      height: 50.h,
      width: 50.w,
      decoration: BoxDecoration(
        color: isColorContainer? ColorsManager.grayColor:Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Center(
        child: SvgPicture.asset(
          imagePath,
          width: widthImage??20.w,
          height:heightImage??20.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
