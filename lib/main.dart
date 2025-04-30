import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:treat/core/routes/app_router.dart';
import 'package:treat/core/routes/routes_manager.dart';
import 'package:treat/core/theme/light_theme.dart';


void main() async{
 WidgetsFlutterBinding.ensureInitialized();
 await EasyLocalization.ensureInitialized();
 runApp( EasyLocalization(
  supportedLocales: [ Locale('en'),  Locale('ar')],
  path: 'assets/translations',
  fallbackLocale: const Locale('en'),
  // useOnlyLangCode: true,
  child: MainApp()));
}

class MainApp extends StatelessWidget {
  //singleton instance of MainApp
  const MainApp._internal();
  static final MainApp _instance = MainApp._internal();
  factory MainApp() => _instance;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: LightAppTheme.get(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: RoutesManager.login,
      ) ,
    );
  }
}
