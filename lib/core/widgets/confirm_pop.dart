import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:treat/core/theme/styles.dart';
import 'package:treat/core/utils/colors.dart';
import 'package:treat/core/utils/dimensions.dart';
import 'package:treat/core/widgets/custom_button.dart';

class ConfirmCancelPopUp extends StatelessWidget {
  const ConfirmCancelPopUp(
      {super.key,
      this.onConfirm,
      required this.title,
      required this.confirmText});

  final VoidCallback? onConfirm;
  final String title;
  final String confirmText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            tr('Are you sure'.tr()),
            textAlign: TextAlign.center,
            style:TextStyles.font21PrimarySemiBold
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style:TextStyles.font21PrimarySemiBold
          ),
          SizedBox(
            height: 35.h,
          ),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  onTap: onConfirm!,
                  lable: confirmText,
                ),
              ),
                  Expanded(
                child: CustomButton(
                  textColor: Color(0xffC1C1C1),
                  backgroundColor: ColorsManager.scaffoldBackgroundColor,
                  borderColor: Color(0xffC1C1C1),
                  onTap: () => Navigator.pop(context),
                  lable: tr('No'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}