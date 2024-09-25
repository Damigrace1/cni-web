import 'package:cni_web/feature/landing_page/component/event_slider.dart';
import 'package:cni_web/feature/landing_page/controllers/home_controller.dart';
import 'package:cni_web/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/widgets/buttons.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  late HomeController _homeController ;
  @override
  void initState() {
    // TODO: implement initState
   _homeController =  Get.put(HomeController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Drawer header
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            // Drawer items
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Handle navigation to Home
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Handle navigation to Settings
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_page),
              title: const Text('Contact'),
              onTap: () {
                // Handle navigation to Contact
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: 40,
          child: Image.asset('assets/images/logo.png'),
        ),
        actions: [
          //   Image.asset('assets/icons/search.png',width: 24,),
          SizedBox(
            width: 12.w,
          )
        ],
      ),
      body:
      LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        return ListView(
          children: [
            SizedBox(
              width: double.infinity,
              height: 400.h,
              child: Stack(
                children: [
                  Container(

                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/c1.jpeg'),
                            fit: BoxFit.cover)),
                    foregroundDecoration:
                    BoxDecoration(color: Colors.black.withOpacity(0.7)),
                  ),
                  Positioned.fill(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('CATALYST NETWORK INTERNATIONAL',
                            style: GoogleFonts.farro(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text('A place to experience the supernatural in God.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.appWhite)),
                        const SizedBox(
                          height: 12,
                        ),
                        const AppButton(text: 'Contact Us',)
                      ]
                          .animate()
                          .slideY(duration: const Duration(milliseconds: 1000)),
                    ),
                  ),
                ],
              ),
            ),
            const EventSlider(),
            Container(
              height: 10.h,
              width: double.infinity,
              alignment: Alignment.center,
              child: ListView.separated(
                  itemCount: 3,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (c, i) => SizedBox(
                    width: 12.w,
                  ),
                  itemBuilder: (context, i) {
                    return Obx(()=>CircleAvatar(
                        backgroundColor:
                        _homeController.eventIndex.value == i ? AppColors.appYellow : AppColors.appBlue,
                        radius: 5));
                  }),
            )
          ],
        );
      },),
    );
  }
}


