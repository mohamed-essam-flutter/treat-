import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treat/core/theme/styles.dart';
import 'package:treat/core/utils/colors.dart';

class CustomListTitle extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final double rating;
  final String distance;
  final Color ratingColor;
  final Color distanceColor;
  final double imageWidth;
  final double imageHeight;
  final VoidCallback? onTap;
  final Widget? icon;
  final bool isFavorite;
  final Function()? onFavoritePressed;
  final Color? favoriteIconColor;

  const CustomListTitle({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    this.rating = 0.0,
    this.distance = '',
    this.ratingColor = const Color(0xffB2866B),
    this.distanceColor = const Color(0xffA4ADA8),
    this.imageWidth = 100,
    this.imageHeight = 80,
    this.onTap,
    this.icon,
    this.isFavorite = false,
    this.onFavoritePressed,
    this.favoriteIconColor,
  });

  @override
  State<CustomListTitle> createState() => _CustomListTitleState();
}

class _CustomListTitleState extends State<CustomListTitle> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 110.h,
        width: 370.w,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.r),
                      child: CachedNetworkImage(
                        imageUrl: widget.imageUrl,
                        width: widget.imageWidth.w,
                        height: widget.imageHeight.h,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Container(color: Colors.grey[200]),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.subtitle,
                              style: TextStyles.font12PrimaryRegular.copyWith(
                                fontSize: 10.sp,
                              ),
                            ),
                            Text(
                              widget.title,
                              style: TextStyles.font14PrimarySemiBold,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 6.h),
                            Row(
                              children: [
                                if (widget.rating > 0) ...[
                                  SvgPicture.asset(
                                    'assets/icons/star.svg',
                                    height: 13.h,
                                    width: 10.w,
                                  ),
                                  SizedBox(width: 2.w),
                                  Text(
                                    widget.rating.toStringAsFixed(1),
                                    style: TextStyles.font12PrimarySemiBold
                                        .copyWith(
                                      color: widget.ratingColor,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                  SizedBox(width: 15.w),
                                ],
                                if (widget.distance.isNotEmpty) ...[
                                  SvgPicture.asset(
                                    'assets/icons/location.svg',
                                    height: 13.h,
                                    width: 10.w,
                                  ),
                                  SizedBox(width: 2.w),
                                  Text(
                                    widget.distance,
                                    style: TextStyles.font12PrimarySemiBold
                                        .copyWith(
                                      color: widget.distanceColor,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ],
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (widget.onFavoritePressed != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: 15,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                        size: 25.w,
                        color: _isFavorite 
                            ? ColorsManager.primary 
                            : widget.favoriteIconColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                        });
                        widget.onFavoritePressed?.call();
                      },
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}