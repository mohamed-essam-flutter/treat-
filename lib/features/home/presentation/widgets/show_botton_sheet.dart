import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:treat/core/theme/styles.dart';
import 'package:treat/core/utils/colors.dart';
import 'package:treat/core/widgets/custom_button.dart';

class ShowBottonSheet extends StatefulWidget {
  const ShowBottonSheet({super.key});

  @override
  State<ShowBottonSheet> createState() => _ShowBottonSheetState();
}

class _ShowBottonSheetState extends State<ShowBottonSheet> {
  DateTime? _selectedDate;
  bool isLocationTab = true;
  bool colorButton = true;
  bool isFemaleSelected = true;
  bool isMaleSelected = false;
  bool isCoupleSelected = false;
  final List<String> items = [
    'A_Item1',
    'A_Item2',
    'A_Item3',
    'A_Item4',
    'B_Item1',
    'B_Item2',
    'B_Item3',
    'B_Item4',
  ];
  List<String> selectedItems = [];
  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  Widget _buildSelectedItems() {
    if (selectedItems.isEmpty) {
      return SizedBox.shrink();
    }

    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children:
          selectedItems.map((item) {
            return Chip(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(36),
              ),
              side: BorderSide(color: Color(0xffB2866B)),
              backgroundColor: Color(0xffB2866B),
              label: Text(item, style: TextStyle(color: Colors.white)),
              deleteIcon: Icon(Icons.close, size: 18, color: Colors.white),
              onDeleted: () {
                setState(() {
                  selectedItems.remove(item);
                });
              },
            );
          }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      height: MediaQuery.sizeOf(context).height * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(30),
        ),
        // color: ColorsManager.scaffoldBackgroundColor
        color: Color(0xffF6F6F6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Cancel".tr(),
                    style: TextStyles.font14PrimaryRegular,
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Filter".tr(),
                    style: TextStyles.font14PrimaryBold.copyWith(
                      color: ColorsManager.black,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Reset".tr(),
                    style: TextStyles.font14PrimaryRegular.copyWith(
                      color: ColorsManager.errorColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 40.h),
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
          SizedBox(height: 40.h),
          Text(
            'Gender'.tr(),
            style: TextStyles.font14PrimaryBold.copyWith(
              color: ColorsManager.black,
            ),
          ),
          SizedBox(height: 3.h),
          Row(
            children: [
              // Expanded(
              //   child: CustomButton(
              //     textSize: 12,
              //     lable: "All".tr(),onTap: () {

              //   },),
              // ),
              Expanded(
                child: CustomButton(
                  backgroundColor:
                      isFemaleSelected ? Color(0xffB2866B) : Color(0xffEBEBEB),
                  textColor:
                      isFemaleSelected
                          ? ColorsManager.white
                          : ColorsManager.primary,
                  height: 45.h,
                  textSize: 12,
                  lable: "Female".tr(),
                  onTap: () {
                    setState(() {
                      isFemaleSelected = !isFemaleSelected;
                      if (isFemaleSelected) {
                        isMaleSelected = false;
                        isCoupleSelected = false;
                      }
                    });
                  },
                ),
              ),
              Expanded(
                child: CustomButton(
                  textColor:
                      isMaleSelected
                          ? ColorsManager.white
                          : ColorsManager.primary,
                  backgroundColor:
                      isMaleSelected ? Color(0xffB2866B) : Color(0xffEBEBEB),
                  height: 45.h,
                  textSize: 12,
                  lable: "Male".tr(),
                  onTap: () {
                    setState(() {
                      isMaleSelected = !isMaleSelected;
                      if (isMaleSelected) {
                        isFemaleSelected = false;
                        isCoupleSelected = false;
                      }
                    });
                  },
                ),
              ),
              Expanded(
                child: CustomButton(
                  textColor:
                      isCoupleSelected
                          ? ColorsManager.white
                          : ColorsManager.primary,
                  backgroundColor:
                      isCoupleSelected ? Color(0xffB2866B) : Color(0xffEBEBEB),
                  height: 45.h,
                  textSize: 12,
                  lable: "Couple".tr(),
                  onTap: () {
                    setState(() {
                      isCoupleSelected = !isCoupleSelected;
                      if (isCoupleSelected) {
                        isFemaleSelected = false;
                        isMaleSelected = false;
                      }
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 40.h),
          Text(
            'Available on'.tr(),
            style: TextStyles.font14PrimaryBold.copyWith(
              color: ColorsManager.black,
            ),
          ),
          SizedBox(height: 3.h),
          EasyDateTimeLine(
            initialDate: DateTime.now(),
            onDateChange: (selectedDate) {
              setState(() {
                _selectedDate = selectedDate;
              });
            },
            headerProps: EasyHeaderProps(
              monthPickerType: MonthPickerType.dropDown,
            ),
            dayProps: EasyDayProps(
              width: 50,
              height: 80,
              dayStructure: DayStructure.dayStrDayNum,
              activeDayStyle: DayStyle(
                decoration: BoxDecoration(
                  color: Color(0xffB2866B),
                  borderRadius: BorderRadius.all(Radius.elliptical(40, 40)),
                ),
              ),
              inactiveDayStyle: DayStyle(
                decoration: BoxDecoration(
                  color: Color(0xffEBEBEB),
                  borderRadius: BorderRadius.all(Radius.elliptical(40, 40)),
                ),
              ),
              todayStyle: DayStyle(
                decoration: BoxDecoration(
                  color: Color(0xffEBEBEB),
                  borderRadius: BorderRadius.all(Radius.elliptical(40, 40)),
                ),
              ),
            ),
          ),
          SizedBox(height: 40.h),
          Text(
            'Services Category'.tr(),
            style: TextStyles.font14PrimaryBold.copyWith(
              color: ColorsManager.black,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Color(0xffECECEC),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Select Items',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items:
                          items.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              enabled: false,
                              child: StatefulBuilder(
                                builder: (context, menuSetState) {
                                  final isSelected = selectedItems.contains(item);
                                  return InkWell(
                                    onTap: () {
                                      isSelected
                                          ? selectedItems.remove(item)
                                          : selectedItems.add(item);
                                      setState(() {});
                                      menuSetState(() {});
                                    },
                                    child: Container(
                                      height: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                      ),
                                      child: Row(
                                        children: [
                                          if (isSelected)
                                            const Icon(Icons.check_box_outlined)
                                          else
                                            const Icon(
                                              Icons.check_box_outline_blank,
                                            ),
                                          const SizedBox(width: 16),
                                          Expanded(
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }).toList(),
                      onChanged: (value) {},
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.only(left: 16, right: 8),
                        height: 40,
                        width: double.infinity,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                        padding: EdgeInsets.zero,
                      ),
                      dropdownStyleData: DropdownStyleData(maxHeight: 250),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                _buildSelectedItems(),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(bottom: 12.h),
            child: CustomButton(lable: 'SHOW RESULT', onTap: () {}),
          ),
        ],
      ),
    );
  }
}
