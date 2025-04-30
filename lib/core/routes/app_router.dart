import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treat/core/routes/routes_manager.dart';
import 'package:treat/features/auth/presentation/pages/login.dart';
import 'package:treat/features/auth/presentation/pages/otp.dart';
import 'package:treat/features/auth/presentation/pages/register.dart';
import 'package:treat/features/home/presentation/pages/branch_detail.dart';
import 'package:treat/features/home/presentation/pages/nav_bar.dart';
import 'package:treat/features/profile/presentation/pages/setting.dart';



class AppRouter {
 // on Generate Route
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RoutesManager.splash:
      //   return CupertinoPageRoute(builder: (_) => const SplashScreen());
      // case RoutesManager.onboarding:
      //   return CupertinoPageRoute(builder: (_) => OnboardingScreen()); // Replace with your Onboarding screen  
      case RoutesManager.login:
        return CupertinoPageRoute(builder: (_) => const LoginScreen());
      case RoutesManager.register:
        return CupertinoPageRoute(builder: (_) => const RegisterScreen());
      case RoutesManager.otp:
        return CupertinoPageRoute(builder: (_) => const OtpScreen());  
      case RoutesManager.nav:
        return CupertinoPageRoute(builder: (_) => const NavBarScreen()); 
      case RoutesManager.branchDetailScreen:
        return CupertinoPageRoute(builder: (_) => const BranchDetailScreen()); 
      case RoutesManager.settingScreen:
        return CupertinoPageRoute(builder: (_) => const SettingScreen());
      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}