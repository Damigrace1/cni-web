import 'package:cni_web/feature/landing_page/component/registration_form.dart';
import 'package:cni_web/feature/landing_page/controllers/home_controller.dart';
import 'package:cni_web/feature/landing_page/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../../../shared/widgets/buttons.dart';
import '../../../utils/colors.dart';

class EventSlider extends StatefulWidget {
  const EventSlider({super.key});

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
  final _eventSliderKey = GlobalKey();
  
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
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.appGreen.withOpacity(0.2)),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Global Fire Conference 2024',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            height: 1,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                             Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Date',
                                        style: TextStyle(
                                            height: 1,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Nov 29 - 30, 2024',
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
                                )),
                            Expanded(
                                child: Column(

                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Venue',
                                        style: TextStyle(
                                            height: 1,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text('Grace of God secondary school, behind Technical college, Idanre.',
                                        style: TextStyle(
                                            height: 1,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    AppButton(
                                      onTap: (){
                                        Get.to(()=>RegForm(eventName: 'GFC \'24',));
                                        // showModalBottomSheet(
                                        //   context: context,
                                        //   isScrollControlled: true, // Allows full height bottom sheet
                                        //   shape: const RoundedRectangleBorder(
                                        //     borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                                        //   ),
                                        //   builder: (BuildContext context) {
                                        //     return const RegForm();
                                        //   },
                                        // );
                                      },
                                      buttonColor: AppColors.appGreen,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text(
                                            'Register',
                                            style:
                                            TextStyle(color: AppColors.appWhite),
                                          ),
                                          const SizedBox(
                                            width: 24,
                                          ),
                                          Image.asset(
                                            'assets/icons/user-tag.png',
                                            width: 20,
                                            color: AppColors.appWhite,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
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
