import 'package:carousel_slider/carousel_slider.dart';
import 'package:cni_web/feature/landing_page/component/event_slider.dart';
import 'package:cni_web/feature/landing_page/controllers/home_controller.dart';
import 'package:cni_web/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/widgets/animated_text.dart';
import '../../../shared/widgets/buttons.dart';
import 'carousels/c1.dart';
import 'carousels/c2.dart';

class TopBody extends StatefulWidget {
  const TopBody({
    super.key,
  });

  @override
  State<TopBody> createState() => _TopBodyState();
}

class _TopBodyState extends State<TopBody> with TickerProviderStateMixin {
  // static AnimationController? bC;
  //
  // static late AnimationController cniTexCont;
  // static AnimationController? longTexCont;
  @override
  void initState() {
    // TODO: implement initState
   // bC = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200.w,
      child: CarouselSlider(
        items: [
          C1(),
          C2(),
        ],
        options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 1,
            onPageChanged: (i, k) {
            //  cniTexCont.forward();
            }),
      ),
    );
  }
}


