// // import 'package:flutter/material.dart';
// // import 'package:introduction_screen/introduction_screen.dart';
// // import 'package:treat/core/utils/assets_manager.dart';
// // class OnboardingScreen extends StatelessWidget {
// //   OnboardingScreen({super.key});
// //   final List<PageViewModel> pages = [
// //     PageViewModel(
// //       title: "مرحبًا بك!",
// //       body: "اكتشف ميزات التطبيق الرائعة.",
// //       image: Center(child: Image.asset(AssetsManager.onboarding1, height: 200.0)),
// //     ),
// //     PageViewModel(
// //       title: "سهولة الاستخدام",
// //       body: "تصفح بسهولة وسرعة.",
// //       image: Center(child: Image.asset(AssetsManager.onboarding2, height: 200.0)),
// //     ),
// //     PageViewModel(
// //       title: "ابدأ الآن",
// //       body: "انضم إلينا واستمتع!",
// //       image: Center(child: Image.asset(AssetsManager.onboarding3, height: 200.0)),
// //     ),
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: IntroductionScreen(
// //         pages: pages,
// //         onDone: () {
// //           // الانتقال إلى الشاشة الرئيسية
// //           Navigator.pushReplacementNamed(
// //             context,
// //             '/login', // استبدل هذا باسم المسار الخاص بشاشتك الرئيسية
// //           );
// //         },
// //         showSkipButton: true,
// //         skip: const Text("تخطي"),
// //         next: const Icon(Icons.arrow_forward),
// //         done: const Text("تم", style: TextStyle(fontWeight: FontWeight.w600)),
// //         dotsDecorator: DotsDecorator(
// //           size: const Size(10.0, 10.0),
// //           activeColor: Colors.blue,
// //           activeSize: const Size(22.0, 10.0),
// //           activeShape: RoundedRectangleBorder(
// //             borderRadius: BorderRadius.circular(25.0),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // on boarding screen wihthout introduction screen package

// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:treat/core/widgets/custom_button.dart';
// import 'package:treat/features/splash_onboarding/onboarding_model.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});
  
//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   int pageIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     var pagesController = PageController();
    
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: PageView.builder(
//                 onPageChanged: (value) {
//                   setState(() {
//                     pageIndex = value;
//                   });
//                 },
//                 controller: pagesController,
//                 itemCount: 3,
//                 itemBuilder: (context, index) {
//                   return Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         pages[index].imagePath,
//                         height: 300,
//                         width: 300,
//                       ),
//                       const SizedBox(height: 20),
//                       Text(
//                         pages[index].title,
//                         style: const TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         pages[index].body,
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(fontSize: 16),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//             SizedBox(
//               height: 60.h,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SmoothPageIndicator(
//                     controller: pagesController, // PageController
//                     count: 3,
//                     effect: WormEffect(
//                       radius: 3
//                     ), // your preferred effect
//                     onDotClicked: (index) {
//                       pagesController.animateToPage(
//                         index,
//                         duration: const Duration(milliseconds: 500),
//                         curve: Curves.easeIn,
//                       );
//                     },
//                   ),
//                   if(pageIndex==2)
//                   SizedBox(height: 60.h,width: 120.w ,child: CustomButton(title: tr('activate'),onTap: () {
//                     Navigator.pushReplacementNamed(context, '/login');
//                   },))            
//                   ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
