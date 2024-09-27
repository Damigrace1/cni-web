import '../component/body2.dart';
import '../exports.dart';

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
     // drawer: AppDrawer(),
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
              TopBody(),
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
                            'assets/images/statm.jpg',
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




