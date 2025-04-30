import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treat/core/theme/styles.dart';
import 'package:treat/core/utils/colors.dart';

class ServiceList extends StatefulWidget {
  final List<ServiceItem> services;
  final ValueChanged<double>? onTotalChanged;

  const ServiceList({
    Key? key,
    required this.services,
    this.onTotalChanged,
  }) : super(key: key);

  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  final List<int> selectedIndices = [];
  double totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.services.length,
      itemBuilder: (context, index) {
        final service = widget.services[index];
        return ServiceListItem(
          service: service,
          isSelected: selectedIndices.contains(index),
          onTap: () {
            setState(() {
              if (selectedIndices.contains(index)) {
                selectedIndices.remove(index);
                totalPrice -= service.price;
              } else {
                selectedIndices.add(index);
                totalPrice += service.price;
              }
              widget.onTotalChanged?.call(totalPrice);
            });
          },
        );
      },
    );
  }
}

class ServiceListItem extends StatelessWidget {
  final ServiceItem service;
  final bool isSelected;
  final VoidCallback onTap;

  const ServiceListItem({
    Key? key,
    required this.service,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        height: 112.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorsManager.white,
          border: isSelected
              ? Border.all(color: ColorsManager.brown)
              : Border.all(color: ColorsManager.white),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20.h,
            horizontal: 25.w,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/icons/time.svg'),
                  SizedBox(width: 3.w),
                  Text(
                    service.duration,
                    style: TextStyles.font14PrimaryRegular.copyWith(
                      
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      service.name,
                      style: TextStyles.font16PrimaryBold
                          .copyWith(color: ColorsManager.black),
                    ),
                  ),
                  isSelected
                      ? SvgPicture.asset('assets/icons/remove.svg')
                      : SvgPicture.asset('assets/icons/add.svg'),
                ],
              ),
              Row(
                children: [
                  Text(
                    'SAR ${service.price}',
                    style: TextStyles.font16PrimaryBold
                        .copyWith(color: ColorsManager.brown),
                  ),
                  if (service.originalPrice != null) ...[
                    SizedBox(width: 5.w),
                    Text(
                      'SR ${service.originalPrice}',
                      style: TextStyles.font14PrimaryMeduim.copyWith(
                        color: ColorsManager.lightGray,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceItem {
  final String name;
  final String duration;
  final double price;
  final double? originalPrice;

  ServiceItem({
    required this.name,
    required this.duration,
    required this.price,
    this.originalPrice,
  });
}