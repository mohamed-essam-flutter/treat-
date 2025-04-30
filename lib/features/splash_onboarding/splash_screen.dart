// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:treat/core/routes/routes_manager.dart';
// import 'package:treat/core/utils/assets_manager.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   Timer? _timer;
//   _SplashScreenState() {
//     _timer = Timer(const Duration(seconds: 3),_goToNextScreen);
//   }
//   _goToNextScreen() {
//     Navigator.pushReplacementNamed(context, RoutesManager.onboarding); // Replace with your home screen route
//   }
//   @override
//   void initState() {
//     super.initState();
//     _SplashScreenState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       backgroundColor: const Color(0xFF181515),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//            Image.asset(AssetsManager.logo,
//               width: 100,
//               height: 100,
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               'Welcome to Mahar App',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   @override
//   void dispose() {
//     _timer?.cancel(); 
//     super.dispose();
//   }
// }