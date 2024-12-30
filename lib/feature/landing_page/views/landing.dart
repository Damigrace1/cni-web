import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart' hide Border;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import '../../../main.dart';
import '../../../utils/strings.dart';
import '../../domain/model/users_data.dart';
import '../component/body2.dart';
import '../exports.dart';



late FToast fToast;

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late HomeController _homeController;
  List<User> results = [];
  showToast(String message, {Color? color,Color? textColor}) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: color??AppColors.appWhite,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/logo.png',width: 16,),
          SizedBox(
            width: 12.0,
          ),
          Text(message,style: TextStyle(color: textColor),),
        ],
      ),
    );


    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2,milliseconds: 500),
    );


  }
  @override
  void initState() {
    // TODO: implement initState
    _homeController = Get.put(HomeController());
    fToast = FToast();
    fToast.init(navigatorKey.currentContext??context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // drawer: AppDrawer(),
     //  appBar: AppBar(
     //    centerTitle: true,
     //    title: SizedBox(
     //      height: 40,
     //      child: Image.asset('assets/images/logo.png'),
     //    ),
     //    actions: [
     //      //   Image.asset('assets/icons/search.png',width: 24,),
     //      SizedBox(
     //        width: 12.w,
     //      )
     //    ],
     //  ),
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
                    child: InkWell(
                      child: Text('Copyrights © 2024 Catalyst Network International.',
                      style: TextStyle(color: AppColors.appGrey),),
                      onLongPress: ()async{
                        String? enteredCode;
                      final isAdmin =  await showDialog(context: context, builder: (context){
                        // return AlertDialog(
                        //   backgroundColor: Colors.transparent,
                        //   content: Container(
                        //     height: 100,
                        //     width: 100,
                        //     color: Colors.red,
                        //   ),
                        // );
                        return AlertDialog(
                          content: Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  onChanged: (v){
                                    enteredCode = v;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Enter Admin code'
                                  ),
                                ),
                                SizedBox(height: 12,),
                                AppButton(text: 'Submit',onTap: (){
                                  Get.back(result: enteredCode?.toLowerCase() == '@cniadmin');
                                },)
                              ],
                            ),
                          ),
                        );
                      });
                      if(!isAdmin)return;
                        showLoader(context);
                        final FirebaseFirestore firestore =
                            FirebaseFirestore.instance;
                       final usersSnapshot =  await firestore
                            .collection('users')
                            .get();

                       final docs = usersSnapshot.docs;
                       users = [];
                       for(var d in docs){
                         users.add(User.fromMap(d.data()));
                       }
                        Get.back();
                       result2Xcel();

                      },
                      splashColor: Colors.transparent,
                    ),
                  )


            ]),
          );
        },
      ),
    );
  }
}
List<User> users = [];
showToast(String message, {Color? color,Color? textColor}) {
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: color??AppColors.appWhite,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/logo.png',width: 16,),
        SizedBox(
          width: 12.0,
        ),
        Text(message,style: TextStyle(color: textColor),),
      ],
    ),
  );


  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: Duration(seconds: 2,milliseconds: 500),
  );


}
result2Xcel()async{
  var excel = Excel.createExcel();
  excel.rename('Sheet1', 'GFC 24');
  Sheet sheet = excel['GFC 24'];
  sheet.appendRow([
    TextCellValue('Name'),
    TextCellValue('Church'),
    TextCellValue('Address'),
    TextCellValue('Gender'),
    TextCellValue('Participation'),
    TextCellValue('Phone'),
    TextCellValue('Reg Date'),
    TextCellValue('School'),
    TextCellValue('Testimony'),

  ]);
  for(var cell in sheet.row(0)){
    cell?.cellStyle =  CellStyle(
      bold: true
    );
  }
  for(var user in users){
    sheet.appendRow([
      TextCellValue(user.name??''),
      TextCellValue(user.church??''),
      TextCellValue(user.address??''),
      TextCellValue(user.gender??''),
      TextCellValue(user.participation??''),
      TextCellValue(user.phone??''),
      TextCellValue('${user.regDate?.day} ${user.regDate?.month} ${user.regDate?.year}'??''),
      TextCellValue(user.school??''),
      TextCellValue(user.testimony??''),

    ]);
  }
  var fileBytes = excel.save();
  if (fileBytes != null) {
    //final directory = await getExternalStorageDirectory();
    final file = File('/storage/emulated/0/Download/GFC 24 Attendance.xlsx')
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes);
    showToast('Result Downloaded',textColor: AppColors.appWhite,
    color: Colors.black.withOpacity(0.8));
  }
}
void showLoader(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        content: SizedBox(
          height: 100,
          width: 100,
          child: Center(
            child: SizedBox(
              width: 15,height: 15,
              child: CircularProgressIndicator.adaptive(strokeWidth: 2,),
            ),
          )
        ),
      ));
}
class ContactUs extends StatelessWidget {
  const ContactUs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start
      ,
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

class ReadMoreBox extends StatefulWidget {
  const ReadMoreBox({
    super.key, required this.body, required this.title,
  });

  final String body;
  final String title;

  @override
  State<ReadMoreBox> createState() => _ReadMoreBoxState();
}

class _ReadMoreBoxState extends State<ReadMoreBox> {

  bool showFull = false;
  @override
  Widget build(BuildContext context) {

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      constraints: BoxConstraints(maxWidth: 400),
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.appBlue.withOpacity(0.1),
          border: Border(bottom: BorderSide(
              width: 2,
              color: AppColors.appRed))
      ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title,

          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),)
        ,
        SizedBox(height: 30,),

        Text(
          showFull ?  widget.body :
          widget.body.substring(0,98),
          maxLines: showFull ? null : 2,
          overflow: showFull ? null : TextOverflow.ellipsis,
          style: TextStyle(color: AppColors.appGrey),),
        SizedBox(height: 30,),
        if(!showFull)
        TextButton(onPressed: (){
          setState(() {
            showFull = true;
          });
        }, child: Container(
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