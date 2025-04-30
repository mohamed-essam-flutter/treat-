import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treat/core/theme/styles.dart';
import 'package:treat/core/utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.lable,
    required this.onTap,
    this.backgroundColor,
    this.width,
    this.height,
    this.textColor,
    this.borderColor,
    this.margin,
    this.textSize,
    this.iconText = false,
    this.nameIconButton,
    this.nameIconColor
  });
  final String lable;
  final Function() onTap;
  final Color? textColor;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? width;
  final double? textSize;
  final double? height;
  final EdgeInsets? margin;
  final bool? iconText;
  final String? nameIconButton;
  final Color? nameIconColor;
  static get screenWidth => ScreenUtil().screenWidth;
  static get screenHeight => ScreenUtil().screenHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          backgroundColor:
              backgroundColor ??
              ColorsManager.primary, // Default background color
          minimumSize: Size(
            width ?? screenWidth,
            height ?? screenHeight * 0.07,
          ), // Default width and height
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
            side: BorderSide(
              color: borderColor ?? ColorsManager.scaffoldBackgroundColor,
              width: 2, // Default border width
            ),
          ),
        ),
        child:
            iconText == false
                ? Text(
                  lable,
                  style: TextStyles.font16WhiteBoldButton.copyWith(
                    fontSize: textSize ?? 16,
                    color:
                        textColor ??
                        ColorsManager
                            .scaffoldBackgroundColor, // Default text color
                  ),
                )
                : Row(
                  children: [
                    SvgPicture.asset(nameIconButton??"",color:nameIconColor,),
                    SizedBox(width: 4.w,),
                    Text(
                      lable,
                      style: TextStyles.font16WhiteBoldButton.copyWith(
                        fontSize: textSize ?? 16,
                        color:
                            textColor ??
                            ColorsManager
                                .scaffoldBackgroundColor, // Default text color
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
