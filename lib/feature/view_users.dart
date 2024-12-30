// import 'dart:io';
//
// import 'package:cni_web/feature/domain/model/users_data.dart';
// import 'package:excel/excel.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// import 'landing_page/exports.dart';
// import 'landing_page/views/landing.dart';
//
// class ViewResult extends StatefulWidget {
//   const ViewResult({Key? key}) : super(key: key);
//
//   @override
//   State<ViewResult> createState() => _ResultsState();
// }
//
// class _ResultsState extends State<ViewResult> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.white,
//         title: Text(
//           '${widget.assessment.subject.capitalizeFirst} Result',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         actions: [
//           InkWell(
//             splashColor: Colors.transparent,
//             onTap: (){
//               if(results.isNotEmpty){
//                 result2Xcel(results,
//                     '${widget.assessment.clas} ${widget.assessment.subject.capitalizeFirst} Result');
//               }
//             },
//             child: Image.asset('assets/icons/download.png',width: 24.w,
//               color: AppColors.primary,),
//           ),
//           SizedBox(width: 24.w,),
//           InkWell(
//             splashColor: Colors.transparent,
//             onTap: (){
//               setState(() {
//
//               });
//             },
//             child: Image.asset('assets/icons/refresh.png',width: 24.w,
//               color: AppColors.primary,),
//           ),
//           SizedBox(width: 24.w,)
//         ],
//       ),
//       body: FutureBuilder(future: FirestoreService().fetchResults(assessment: widget.assessment),
//         builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) {
//           if(snapshot.connectionState == ConnectionState.done){
//             if((snapshot.data is List<Result>) && snapshot.hasData){
//               results = snapshot.data as List<Result>;
//               return  Container(
//                 margin: EdgeInsets.symmetric(horizontal: 24.w),
//                 decoration: BoxDecoration(
//                     border: Border.all(color: AppColors.black)
//                 ),
//                 child: ListView(
//                   shrinkWrap: true,
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 12.h),
//                       decoration: BoxDecoration(
//                         color: AppColors.grey4,
//                       ),
//                       child: Row(children: [
//                         Expanded(child: Text('Name',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600),)),
//                         Expanded(child: Text('Score',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600),)),
//                       ],),
//                     ),
//                     ...List.generate(results.length, (index){
//                       return ResultRow(name: results[index].name,
//                           result: results[index].grade, color:
//                           index.isEven ? AppColors.white : AppColors.grey4);
//                     }),
//                   ],
//                 ),
//               );
//             }
//             else if(snapshot.data is List && (snapshot.data as List).isEmpty) {
//               return Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 24.w),
//                 child: Column(
//                   children: [
//                     SizedBox(height: 100,),
//                     SizedBox(
//                       height: 150,width: 150,
//                       child: Lottie.asset('assets/lottie/empty.json',
//                       ),
//                     ),
//                     Text('No result for this assessment',
//                       style: TextStyle(color: AppColors.darkGrey),),
//                     SizedBox(height: 24,),
//                     CustomButton(
//                       width: 100,
//                       title: 'Go back',
//                       onPressed: (){
//                         Get.back();
//                       },
//                     )
//                   ],
//                 ),
//               );
//             }
//             else{
//               return Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 24.w),
//                 child: Column(
//                   children: [
//                     SizedBox(height: 100,),
//                     SizedBox(
//                       height: 150,width: 150,
//                       child: Lottie.asset('assets/lottie/error.json',
//                           repeat: false),
//                     ),
//                     const Text('An Error Occurred'),
//                     SizedBox(height: 24,),
//                     CustomButton(
//                       width: 100,
//                       title: 'Retry',
//                       onPressed: (){
//                         setState(() {
//
//                         });
//                       },
//                     )
//                   ],
//                 ),
//               );
//             }
//           }
//           return AlertDialog(
//             backgroundColor: Colors.transparent,
//             content: SizedBox(
//               height: 100,width: 100,
//               child: Lottie.asset('assets/lottie/loading1.json',
//               ),
//             ),
//           );
//         },),
//     );
//   }
// }