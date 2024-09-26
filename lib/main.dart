import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

import 'feature/landing_page/views/landing.dart';

void main() {
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
                textTheme: GoogleFonts.poppinsTextTheme(
                  Theme.of(context).textTheme, // Use default theme styles and override them
                ),
              ),
              home: const LandingPage()


          );
        });
  }
}

