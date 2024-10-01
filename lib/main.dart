import 'package:cni_web/feature/landing_page/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

import 'feature/landing_page/views/landing.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
        ensureScreenSize: true,
        designSize: const Size(375, 812),
        builder: (context, _) {
          return  GetMaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.light,
              theme: ThemeData(
                progressIndicatorTheme: ProgressIndicatorThemeData(
                  color: AppColors.appWhite
                ),
                textTheme: GoogleFonts.poppinsTextTheme(
                  Theme.of(context).textTheme, // Use default theme styles and override them
                ),
              ),
              home: const LandingPage()


          );
        });
  }
}

