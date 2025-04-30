import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treat/core/theme/styles.dart';
import 'package:treat/core/utils/colors.dart';

class CustomCardScreen extends StatelessWidget {
  const CustomCardScreen({super.key, required this.name, required this.icon,this.iconColor,this.textColor});
  final String name;
  final String icon;
  final Color? iconColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      color: ColorsManager.scaffoldBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
             width: 20.w, 
          child: SvgPicture.asset(icon, width: 18.w, height: 19.h,color:iconColor?? ColorsManager.primary,)),
          SizedBox(width: 10.w,),
          Text(name, style: TextStyles.font14PrimaryRegular.copyWith(
            color: textColor??ColorsManager.primary
          )),
        ],
      ),
    );
  }
}
