import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:treat/core/theme/styles.dart';
import 'package:treat/core/utils/colors.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final bool readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? borderSideColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  const AppTextFormField({
    super.key,
    this.readOnly = false,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.prefixIcon,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    this.icon,
    required this.validator,
    this.borderSideColor
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      decoration: InputDecoration(
        icon: icon,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide:  BorderSide(
                color:borderSideColor?? ColorsManager.white,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0.r),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide:  BorderSide(
                color:borderSideColor?? ColorsManager.white,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0.r),
            ),
        errorBorder: OutlineInputBorder(
          borderSide:  BorderSide(
            color:borderSideColor?? ColorsManager.white,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide:  BorderSide(
            color: borderSideColor??Colors.white,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0.r),
        ),
        hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,
        hintText: hintText,
        suffixIcon: suffixIcon,
        // suffixIcon: suffixIcon != null?ConstrainedBox(constraints: BoxConstraints(
        //      maxHeight: 24.h,
        //       maxWidth: 24.w,
        // ),
        // child: suffixIcon!,
        // ):null,
        fillColor: backgroundColor ?? ColorsManager.white,
        filled: true,
        prefixIcon: prefixIcon != null?ConstrainedBox(constraints: BoxConstraints(
             maxHeight: 24.h,
              maxWidth: 24.w,
        ),
        child: prefixIcon!,
        ):null
      ),
      obscureText: isObscureText ?? false,
      style: TextStyles.font14DarkBlueMedium,

      validator: (value) {
        return validator(value);
      },
    );
  }
}