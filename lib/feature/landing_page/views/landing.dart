import '../../../utils/strings.dart';
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
                  constraints.maxWidth > 900?
                  Row(
                    children: [
                      ReadMoreBox(
                        title: 'History of CNI',
                        body: cniHistory,
                      ),
                      SizedBox(width: 12,),
                      ReadMoreBox(
                        title: 'Our Vision and Mandate',
                        body: cniVisMand,
                      ),
                    ],
                  ) :
                  Column(
                    children: [
                      ReadMoreBox(
                        title: 'History of CNI',
                        body: cniHistory,
                      ),
                      SizedBox(height: 12,),
                      ReadMoreBox(
                        title: 'Our Vision and Mandate',
                        body: cniVisMand,
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.all(12),
                     child:  constraints.maxWidth > 900?
                  Row(
                    children: [
                      ContactCard(),
                      SizedBox(width: 10,),
                      ContactUs()
                    ],
                  ) :
                  Column(

                    children: [
                      ContactCard(),
                      SizedBox(height: 30,),
                      ContactUs()
                    ],
                  )),
                  SizedBox(),
                  Container(
                    width: double.infinity,
                    color: Colors.black87,
                    padding:EdgeInsets.all(12),
                    child: Text('Copyrights © 2024 Catalyst Network International.',
                    style: TextStyle(color: AppColors.appGrey),),
                  )


            ]),
          );
        },
      ),
    );
  }
}

class ContactUs extends StatelessWidget {
  const ContactUs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Get in Touch', style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,
            color: AppColors.appRed)),
        SizedBox(height: 20),
        Text('Don\'t hesitate Contact Us', style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,
            color: AppColors.appBlack)),
        SizedBox(height: 30),
        AppButton(
          text: 'Contact Us',
          onTap: (){},
        )
      ],
    );
  }
}

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        SlideEffect(
         begin: Offset(0,0),
         end: Offset(0,0.1),
          duration: 3000.ms,
        ),

      ],
      delay: 100.ms,
      autoPlay: true,
      onPlay: (controller) => controller.repeat(reverse: true),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.appRed,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            ColorFiltered(

                child: Image.asset('assets/icons/message.png',width: 24,),
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcATop),),
            SizedBox(height: 20),
            Text('Call', style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,
            color: AppColors.appWhite),),
            SizedBox(height: 20),
            Text('Technical Road, Idanre, Ondo State.', style: TextStyle(fontSize: 16,
                color: AppColors.appWhite),),
            SizedBox(height: 20),
            Text('+2348103373964', style: TextStyle(fontSize: 23,fontWeight: FontWeight.w800,
                color: AppColors.appWhite),),
            SizedBox(height: 20),
            Text('ogdamtim@gmail.com', style: TextStyle(fontSize: 16,
                color: AppColors.appWhite),),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ReadMoreBox extends StatelessWidget {
  const ReadMoreBox({
    super.key, required this.body, required this.title,
  });

  final String body;
  final String title;

  @override
  Widget build(BuildContext context) {

    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),

          border: Border(bottom: BorderSide(
              width: 2,
              color: AppColors.appRed))
      ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,

          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),)
        ,
        SizedBox(height: 30,),

        Text(body.substring(0,98),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: AppColors.appGrey),),
        SizedBox(height: 30,),
        TextButton(onPressed: (){}, child: Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(
                  width: 2,
                  color: AppColors.appRed))
            ),
            child: Text('Read More',style: TextStyle(color: AppColors.appRed),)))
      ],
    ),);
  }
}