import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:treat/core/utils/colors.dart';
import 'package:treat/features/cart/presentation/pages/booking.dart';
import 'package:treat/features/favorites/presentation/pages/favorites.dart';
import 'package:treat/features/home/presentation/pages/home.dart';
import 'package:treat/features/profile/presentation/pages/profile.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int _selectedPage = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    BookingScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: StyleProvider(
        style:Style() ,
        child: ConvexAppBar(
          curveSize: 80,
          top: -20,
          backgroundColor:ColorsManager.primary ,
          style: TabStyle.react,
          shadowColor: ColorsManager.primary,
          items: [
            TabItem(icon: Icons.home, title: 'HOME'.tr(),),
            TabItem(icon: Icons.calendar_month_rounded, title: 'BOOKING'.tr()),
            TabItem(icon: Icons.favorite_border, title: 'FAVORITES'.tr()),
            TabItem(icon: Icons.people, title: 'ACCOUNT'),
            // TabItem(icon: null),
          ],
          initialActiveIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
        ),
      ),
      body: _pages[_selectedPage],
    );
  }
}
class Style extends StyleHook {
  @override
  double get activeIconSize => 40;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => 20;

  @override
  TextStyle textStyle(Color color, String? fontFamily) {
    return TextStyle(fontSize: 10, color: color, fontFamily: fontFamily);
  }
}