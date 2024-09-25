import 'package:carousel_slider/carousel_slider.dart';
import 'package:cni_web/feature/landing_page/component/registration_form.dart';
import 'package:cni_web/feature/landing_page/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../../../shared/widgets/buttons.dart';
import '../../../utils/colors.dart';

class EventSlider extends StatefulWidget {
  const EventSlider({Key? key}) : super(key: key);

  @override
  State<EventSlider> createState() => _EventSliderState();
}

class _EventSliderState extends State<EventSlider> {
  int index = 0;

  late PageController controller;
  @override
  void initState() {
   controller = PageController();
   // controller.addListener((){
   //   if(index == 2){
   //     index = 0;
   //   }
   //   Future.delayed(Duration(seconds: 3),(){
   //
   //     controller.animateToPage(index++, duration: 1000.milliseconds, curve: Curves.bounceInOut);
   //   });
   // });
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        itemCount: 3,

        controller: controller,
              onPageChanged: (i) {
                setState(() {
                  Get.find<HomeController>().eventIndex.value = i;
                });},
        itemBuilder: (BuildContext context, int itemIndex,) =>
            Center(
              child: Container(
                // height: 200,
                  margin: EdgeInsets.symmetric(horizontal: 24,vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.appGreen.withOpacity(0.2)),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Global Fire Conference 2024',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            height: 1,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Column(
                                children: [
                                  Text('Date',
                                      style: TextStyle(
                                          height: 1,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Nov 24 - 27, 2024',
                                      style: TextStyle(
                                          height: 1,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  AppButton(
                                    text: 'More details',
                                    isPrimary: false,
                                    buttonColor: AppColors.appGreen,
                                  ),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                              )),
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Venue',
                                      style: TextStyle(
                                          height: 1,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('RCCG Yaba, Idanre',
                                      style: TextStyle(
                                          height: 1,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  AppButton(
                                    onTap: (){
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true, // Allows full height bottom sheet
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                                        ),
                                        builder: (BuildContext context) {
                                          return RegForm();
                                        },
                                      );
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Register',
                                          style:
                                          TextStyle(color: AppColors.appWhite),
                                        ),
                                        SizedBox(
                                          width: 24,
                                        ),
                                        Image.asset(
                                          'assets/icons/user-tag.png',
                                          width: 20,
                                          color: AppColors.appWhite,
                                        )
                                      ],
                                    ),
                                    buttonColor: AppColors.appGreen,
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ],
                  )),
            ),
      ),
    );
    // return CarouselSlider.builder(
    //     itemCount: 3,
    //     carouselController: controller,
    //     itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
    //         Center(
    //           child: Container(
    //               // height: 200,
    //               margin: EdgeInsets.symmetric(horizontal: 24),
    //               decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(12),
    //                   color: AppColors.appGreen.withOpacity(0.2)),
    //               padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    //               child: Column(
    //                 mainAxisSize: MainAxisSize.min,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     'Global Fire Conference 2024',
    //                     style: TextStyle(
    //                         height: 1,
    //                         fontSize: 20,
    //                         fontWeight: FontWeight.bold),
    //                   ),
    //                   SizedBox(
    //                     height: 30,
    //                   ),
    //                   Row(
    //                     children: [
    //                       Expanded(
    //                           child: Column(
    //                         children: [
    //                           Text('Date',
    //                               style: TextStyle(
    //                                   height: 1,
    //                                   fontSize: 12,
    //                                   fontWeight: FontWeight.bold)),
    //                           SizedBox(
    //                             height: 10,
    //                           ),
    //                           Text('Nov 24 - 27, 2024',
    //                               style: TextStyle(
    //                                   height: 1,
    //                                   fontSize: 16,
    //                                   fontWeight: FontWeight.bold)),
    //                           SizedBox(
    //                             height: 30,
    //                           ),
    //                           AppButton(
    //                             text: 'More details',
    //                             isPrimary: false,
    //                             buttonColor: AppColors.appGreen,
    //                           ),
    //                         ],
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                       )),
    //                       Expanded(
    //                           child: Column(
    //                         children: [
    //                           Text('Venue',
    //                               style: TextStyle(
    //                                   height: 1,
    //                                   fontSize: 12,
    //                                   fontWeight: FontWeight.bold)),
    //                           SizedBox(
    //                             height: 10,
    //                           ),
    //                           Text('RCCG Yaba, Idanre',
    //                               style: TextStyle(
    //                                   height: 1,
    //                                   fontSize: 16,
    //                                   fontWeight: FontWeight.bold)),
    //                           SizedBox(
    //                             height: 30,
    //                           ),
    //                           AppButton(
    //                             child: Row(
    //                               mainAxisSize: MainAxisSize.min,
    //                               children: [
    //                                 Text(
    //                                   'Register',
    //                                   style:
    //                                       TextStyle(color: AppColors.appWhite),
    //                                 ),
    //                                 SizedBox(
    //                                   width: 24,
    //                                 ),
    //                                 Image.asset(
    //                                   'assets/icons/user-tag.png',
    //                                   width: 20,
    //                                   color: AppColors.appWhite,
    //                                 )
    //                               ],
    //                             ),
    //                             buttonColor: AppColors.appGreen,
    //                           ),
    //                         ],
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                       )),
    //                     ],
    //                   ),
    //                 ],
    //               )),
    //         ),
    //     options: CarouselOptions(
    //       //  height: 200,
    //       aspectRatio: 2,
    //       viewportFraction: 1,
    //       enableInfiniteScroll: true,
    //       reverse: false,
    //       autoPlay: false,
    //       autoPlayInterval: Duration(seconds: 3),
    //       autoPlayAnimationDuration: Duration(milliseconds: 800),
    //       autoPlayCurve: Curves.fastOutSlowIn,
    //       enlargeCenterPage: true,
    //       enlargeFactor: 0.5,
    //       onPageChanged: (i, k) {
    //         setState(() {
    //           Get.find<HomeController>().eventIndex.value = i;
    //         });
    //       },
    //       scrollDirection: Axis.horizontal,
    //     ));
  }
}
