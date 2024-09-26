import 'package:cni_web/feature/landing_page/component/event_slider.dart';
import 'package:cni_web/feature/landing_page/controllers/home_controller.dart';
import 'package:cni_web/utils/colors.dart';
import 'package:flutter/cupertino.dart';
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
  late HomeController _homeController;
  @override
  void initState() {
    // TODO: implement initState
    _homeController = Get.put(HomeController());
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
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              SizedBox(
                width: double.infinity,
                height: 200.w,
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
                          const Text(
                              'A place to experience the supernatural in God.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.appWhite)),
                          const SizedBox(
                            height: 12,
                          ),
                          const AppButton(
                            text: 'READ ABOUT MINISTRY',
                          )
                        ]
                            .animate()
                            .slideY(duration: const Duration(milliseconds: 300)),
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
                      return Obx(() => CircleAvatar(
                          backgroundColor: _homeController.eventIndex.value == i
                              ? AppColors.appYellow
                              : AppColors.appBlue,
                          radius: 5));
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: constraints.maxWidth < 730
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/c2.jpg',
                            width: 420,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Body2(
                            cw: constraints.maxWidth,
                          )
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/c2.jpg',
                            width: 420,
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Expanded(
                            child: Body2(
                              cw: constraints.maxWidth,
                            ),
                          )
                        ],
                      ),
              ),
              SizedBox(height: 30,),
            ]),
          );
        },
      ),
    );
  }
}

class Body2 extends StatelessWidget {
  const Body2({
    super.key,
    required this.cw,
  });
  final double cw;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ABOUT US',
          style: TextStyle(
              color: AppColors.appBlue,
              fontWeight: FontWeight.w800,
              fontSize: 17),
        ),
        SizedBox(
          height: 20,
        ),
        Text('We are Taking Bold Steps to Make Earth Heaven',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 35)),
        SizedBox(
          height: 20,
        ),
        Text(
            'We welcome you with great joy to CNI. We are here to share the great news of Jesus Christ to all that will listen.',
            style: TextStyle(color: Colors.grey)),
        SizedBox(
          height: 30,
        ),
        cw > 550
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: WeDoThis(
                        child: Icon(
                          Icons.favorite_rounded,
                          color: AppColors.appWhite,
                        ),
                        title: 'Place of Heaven',
                        body:
                            'In CNI you will feel divinity, piety, goodness, faith or right beliefs.'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: WeDoThis(
                        child: Icon(
                          CupertinoIcons.book,
                          color: AppColors.appWhite,
                        ),
                        title: 'Study Bible',
                        body:
                            'Learn the Bible enhance your wisdom, give you boldness about your faith.'),
                  )
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WeDoThis(
                      child: Icon(
                        Icons.favorite_rounded,
                        color: AppColors.appWhite,
                      ),
                      title: 'Place of Heaven',
                      body:
                          'In Zegen you will feel divinity, piety, goodness, faith or right beliefs.'),
                  SizedBox(
                    height: 20,
                  ),
                  WeDoThis(
                      child: Icon(
                        CupertinoIcons.book,
                        color: AppColors.appWhite,
                      ),
                      title: 'Study Bible',
                      body:
                          'Learn the Bible enhance your wisdom, give you boldness about your faith.')
                ],
              ),
        SizedBox(height: 30.h,),
        AppButton(text: 'Learn More',
          width: 150,)
      ],
    );
  }
}

class WeDoThis extends StatelessWidget {
  const WeDoThis(
      {Key? key, required this.child, required this.title, required this.body})
      : super(key: key);
  final Widget child;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.appRed,
          child: child,
        ),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          body,
          style: TextStyle(color: AppColors.appGrey),
        ),
      ],
    );
  }
}
