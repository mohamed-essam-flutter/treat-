import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:treat/core/theme/styles.dart';
import 'package:treat/core/utils/colors.dart';
import 'package:treat/core/widgets/custom_button.dart';
import 'package:treat/features/home/presentation/widgets/banner.dart';
import 'package:treat/features/home/presentation/widgets/custom_bottom_sheet.dart';
import 'package:treat/features/home/presentation/widgets/custom_service_list.dart';

class BranchDetailScreen extends StatefulWidget {
  const BranchDetailScreen({super.key});

  @override
  State<BranchDetailScreen> createState() => _BranchDetailScreenState();
}

class _BranchDetailScreenState extends State<BranchDetailScreen> {
  bool selectButton = true;
  int selectedIndex = 0;
  List<int> selectedIndexListView = [];
  double totalPrice = 0.0;
  final List<ServiceItem> services = [
  ServiceItem(
    name: 'Service lorem ipsum',
    duration: '45min',
    price: 50,
    originalPrice: 55,
  ),
  ServiceItem(
    name: 'Service lorem ipsum',
    duration: '45min',
    price: 50,
    originalPrice: 55,
  ),
  ServiceItem(
    name: 'Service lorem ipsum',
    duration: '45min',
    price: 50,
    originalPrice: 55,
  ),
  ServiceItem(
    name: 'Service lorem ipsum',
    duration: '45min',
    price: 50,
    originalPrice: 55,
  ),
  ServiceItem(
    name: 'Service lorem ipsum',
    duration: '45min',
    price: 50,
    originalPrice: 55,
  ),
  ServiceItem(
    name: 'Service lorem ipsum',
    duration: '45min',
    price: 50,
    originalPrice: 55,
  ),
  ServiceItem(
    name: 'Service lorem ipsum',
    duration: '45min',
    price: 50,
    originalPrice: 55,
  ),
  ServiceItem(
    name: 'Service lorem ipsum',
    duration: '45min',
    price: 50,
    originalPrice: 55,
  ),
  // Add more services as needed
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SafeArea(
                    bottom: false,
                    right: false,
                    left: false,
                    child: HomeBanner(
                      image:
                          'https://cdn.pixabay.com/photo/2025/04/16/06/25/penguin-9536897_1280.jpg',
                      itemCount: 3,
                      heightImage: 200.h,
                    ),
                  ),
                  Positioned(
                    top: 35.h,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back,
                            color: ColorsManager.white,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.65,
                        ),
                        InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundColor: ColorsManager.white,
                            maxRadius: 18,
                            child: SvgPicture.asset(
                              'assets/icons/favorites.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: SizedBox(
                  height: 100,
                  // decoration: BoxDecoration(color: Color(0x0FBDA8AB)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        minRadius: 38,
                        backgroundImage: NetworkImage(
                          "https://cdn.pixabay.com/photo/2025/04/16/06/25/penguin-9536897_1280.jpg",
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tacha Beauty Center',
                                style: TextStyles.font16PrimarySemiBold
                                    .copyWith(
                                      color: Color(0xff050505),
                                      fontSize: 18,
                                    ),
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/eye.svg',
                                    height: 13.h,
                                    width: 10.w,
                                  ),
                                  SizedBox(width: 4.w),
                                  InkWell(
                                    onTap: () => showAboutBottomSheet(context),
                                    child: Text(
                                      'About'.tr(),
                                      style: TextStyles.font12PrimarySemiBold
                                          .copyWith(
                                            fontSize: 14.sp,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                    ),
                                  ),
                                  Spacer(),
                                  SvgPicture.asset(
                                    'assets/icons/location.svg',
                                    height: 13.h,
                                    width: 10.w,
                                  ),
                                  SizedBox(width: 4.w),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Text(
                                        'location'.tr(),
                                        style: TextStyles.font12PrimarySemiBold
                                            .copyWith(
                                              fontSize: 14.sp,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 6.h),
                              Container(
                                // color: Color(0xff777777),
                                child: Text(
                                  'White Friday Save 20% : FRI2024 ',
                                  style: TextStyles.font12PrimaryBold.copyWith(
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: SizedBox(
                  height: 80,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: [
                      Positioned(
                        left: 0,
                        child: CustomButton(
                          textSize: 14,
                          height: 45,
                          backgroundColor:
                              selectButton
                                  ? ColorsManager.primary
                                  : Color(0xffEBEBEB),
                          textColor:
                              selectButton
                                  ? ColorsManager.white
                                  : ColorsManager.primary,
                          width: 160.w,
                          lable: 'Book'.tr(),
                          onTap: () {
                            setState(() {
                              selectButton = true;
                            });
                          },
                        ),
                      ),
                      Positioned(
                        left: 130.w,
                        child: CustomButton(
                          textSize: 14,
                          height: 45,
                          backgroundColor:
                              selectButton
                                  ? Color(0xffEBEBEB)
                                  : ColorsManager.primary,
                          textColor:
                              selectButton
                                  ? ColorsManager.primary
                                  : ColorsManager.white,
                          nameIconColor:
                              selectButton
                                  ? ColorsManager.primary
                                  : ColorsManager.white,
                          width: 160.w,
                          lable: 'Send Gift'.tr(),
                          onTap: () {
                            setState(() {
                              selectButton = false;
                            });
                          },
                          iconText: true,
                          nameIconButton: 'assets/icons/gift.svg',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Text(
                    'Our Services'.tr().tr(),
                    style: TextStyles.font14PrimaryBold.copyWith(
                      color: Color(0xff222222),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              SizedBox(
                height: 40.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,

                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: CustomButton(
                        textSize: 13,
                        backgroundColor:
                            selectedIndex != index
                                ? ColorsManager.scaffoldBackgroundColor
                                : ColorsManager.brown,
                        textColor:
                            selectedIndex != index
                                ? ColorsManager.primary
                                : ColorsManager.white,
                        borderColor:
                            selectedIndex != index
                                ? Color(0xffA4ADA8)
                                : ColorsManager.brown,
                        width: 90.w,
                        height: 39.h,
                        lable: 'AllJJJJJ',
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        nameIconButton: 'assets/icons/gift.svg',
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h),
              Column(
                children: [
                  ServiceList(
                    services: services,
                    onTotalChanged: (total) {
                      print('Total price changed: $total');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 130.h,
        color: ColorsManager.white,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Total',
                        style: TextStyles.font14PrimaryMeduim.copyWith(
                          color: ColorsManager.black,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '(${selectedIndexListView.length} Services)',
                        style: TextStyles.font14PrimaryRegular.copyWith(
                          color: ColorsManager.lightGray,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'SR $totalPrice',
                    style: TextStyles.font16PrimaryBold.copyWith(
                      color: ColorsManager.brown,
                    ),
                  ),
                ],
              ),
            ),
            selectButton == true
                ? SafeArea(
                  top: false,
                  right: false,
                  left: false,
                  child: CustomButton(
                    height: 60.h,
                    width: 195.w,
                    lable: 'BOOK'.tr(),
                    onTap: () {},
                  ),
                )
                : SafeArea(
                  top: false, 
                  right: false,
                  left: false,
                  child: CustomButton(
                    height: 60.h,
                    iconText: true,
                    nameIconButton: 'assets/icons/gift.svg',
                    width: 195.w,
                    lable: 'SEND'.tr(),
                    onTap: () {},
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
