import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:treat/core/theme/styles.dart';
import 'package:treat/core/utils/colors.dart';
import 'package:treat/core/widgets/custom_icon.dart';



class CustomDropdownButtonFormField<T> extends StatelessWidget {
  final T? value;
  final List<DropdownMenuItem<T>>? items;
  final ValueChanged<T?>? onChanged;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final TextStyle? textStyle;
  final Color? dropdownColor;
  final Color? iconColor;
  final Color? buttonBackgroundColor;
  final double iconSize;
  final EdgeInsetsGeometry? padding;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final bool? isExpanded;
  final bool isDense;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FormFieldValidator<T>? validator;
  final bool autovalidate;
  final double? borderRadius;
  final Color? fillColor;
  final bool filled;
  final bool showLabel;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final EdgeInsetsGeometry? contentPadding;

  const CustomDropdownButtonFormField({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hintText,
    this.labelText,
    this.errorText,
    this.textStyle,
    this.dropdownColor,
    this.iconColor,
    this.iconSize = 24.0,
    this.padding,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.isExpanded = false,
    this.isDense = true,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.autovalidate = false,
    this.borderRadius = 8.0,
    this.fillColor,
    this.filled = false,
    this.showLabel = true,
    this.labelStyle,
    this.errorStyle,
    this.contentPadding, this.buttonBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      decoration: BoxDecoration(
        color: buttonBackgroundColor?? ColorsManager.white, // Apply button background color
        borderRadius: BorderRadius.circular(16),
      ),
      child: DropdownButtonFormField<T>(
        value: value,
        items: items,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:TextStyles.font16PrimaryRegular.copyWith(
            color: Color(0xff777777),
          ),
          labelText: showLabel ? labelText : null,
          errorText: errorText,
          prefixIcon: prefixIcon,
          suffixIcon: CustomIcon(imagePath: 'assets/icons/arrow_down.svg',heightImage: 8.h,widthImage: 12.w,),
          filled: filled,
          fillColor: fillColor??  ColorsManager.white,
          contentPadding: contentPadding ?? const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12.0,
          ),
          border: border ?? OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.white,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0.r),
            ),
          enabledBorder: enabledBorder ?? OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.white,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0.r),
            ),
          focusedBorder: focusedBorder ?? OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.white,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0.r),
            ),
          errorBorder: errorBorder ?? OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.white,
                width: 1.3,
              ),       
              borderRadius: BorderRadius.circular(16.0.r),
            ),
          focusedErrorBorder: focusedErrorBorder ?? OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.white,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0.r),
            ),
          labelStyle: labelStyle ?? theme.textTheme.bodyMedium,
          errorStyle: errorStyle ?? theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.error,
          ),
        ),
        style: textStyle ?? theme.textTheme.bodyMedium,
        dropdownColor: dropdownColor ?? ColorsManager.white,
        icon: const SizedBox.shrink(),
        iconSize: 0,
        isExpanded: isExpanded ?? true,
        isDense: isDense,
        borderRadius: BorderRadius.circular(borderRadius?? 16.0.r),
        validator: validator,
        autovalidateMode: autovalidate 
            ? AutovalidateMode.always 
            : AutovalidateMode.disabled,
      ),
    );
  }
}
