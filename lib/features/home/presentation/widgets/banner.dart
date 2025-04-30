import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:treat/core/utils/colors.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key, required this.image, required this.itemCount,this.heightImage});
  final String image;
  final int itemCount;
  final double? heightImage;


  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  int _currentIndex = 0;
  @override
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider.builder(
          itemCount: widget.itemCount,
          itemBuilder: (context, index, realIndex) {
            return Container(
              width: MediaQuery.sizeOf(context).width,
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CachedNetworkImage(
                  imageUrl:
                    widget.image,
                  // height: 130,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: widget.heightImage??130,
            autoPlay: true,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
               setState(() => _currentIndex = index);
            },
          ),
        ),
        SizedBox(height: 7.h,),
        Center(
          child: SmoothPageIndicator(
            controller:PageController(initialPage: _currentIndex) , // تأكد من ربطه بـ PageController
            count: widget.itemCount,
            effect: WormEffect(
              dotHeight: 8,
              dotWidth: 8,
              activeDotColor: ColorsManager.primary,
            ),
          ),
        ),
      ],
    );
  }
}
