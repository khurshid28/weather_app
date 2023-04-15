// import 'package:app_for_test/exportFiles.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:web_socket_channel/io.dart';

// class BuyurtmaAlert extends StatelessWidget {
//   Map command;
//   Map order;
//   IOWebSocketChannel channel;
//   BuyurtmaAlert({super.key, required this.channel, required this.command,required this.order});

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         return false;
//       },
//       child: AlertDialog(
//         backgroundColor: Colors.transparent,
//         shadowColor: Colors.transparent,
//         content: Container(
//           height: 473.h,
//           width: 310.w,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     splashColor: Colors.transparent,
//                     highlightColor: Colors.transparent,
//                     child: Padding(
//                       padding: EdgeInsets.all(5.0.w),
//                       child: Icon(
//                         Icons.close,
//                         color: Colors.white,
//                         size: 42.w,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Container(
//                 width: 310.w,
//                 // height: 420.h,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(
//                       20.r,
//                     ),
//                     bottomLeft: Radius.circular(
//                       20.r,
//                     ),
//                     bottomRight: Radius.circular(
//                       20.r,
//                     ),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       width: 310.w,
//                       height: 64.h,
//                       padding: EdgeInsets.symmetric(horizontal: 15.w),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Buyurtma".tr(),
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w700,
//                               fontSize: 18.sp,
//                             ),
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Text(
//                                 order["ordered_time"].toString().split("T")[0].split("-").join("."),
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 13.sp,
//                                 ),
//                               ),
//                               Text(
//                                 order["ordered_time"].toString().split("T")[1].split(".")[0],
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 13.sp,
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                       decoration: BoxDecoration(
//                         color: AppConstant.primaryColor,
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(
//                             20.r,
//                           ),
//                           bottomRight: Radius.circular(
//                             20.r,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 8.h,
//                     ),
//                     Container(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 14.w,
//                       ),
//                       // height: 140.h,
//                       width: 310.w,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Padding(
//                             padding:  EdgeInsets.symmetric(vertical: 8.h),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Icon(
//                                   Icons.location_on,
//                                   color: Colors.grey,
//                                   size: 32,
//                                 ),
//                                 SizedBox(
//                                   width: 10.w,
//                                 ),
//                                 Text(
//                                  order["address_from"],
//                                   style: TextStyle(
//                                     color: AppConstant.primaryColor,
//                                     fontSize: 20.sp,
//                                     fontWeight: FontWeight.w700,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding:  EdgeInsets.symmetric(vertical: 8.h),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Icon(
//                                   Icons.location_on,
//                                   color: AppConstant.primaryColor,
//                                   size: 32,
//                                 ),
//                                 SizedBox(
//                                   width: 10.w,
//                                 ),
//                                 Text(
//                                   order["address_to"],
//                                   style: TextStyle(
//                                     color: AppConstant.primaryColor,
//                                     fontSize: 20.sp,
//                                     fontWeight: FontWeight.w700,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                              padding:  EdgeInsets.symmetric(vertical: 8.h),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Icon(
//                                       Icons.gas_meter,
//                                       color: AppConstant.primaryColor,
//                                       size: 32,
//                                     ),
//                                     SizedBox(
//                                       width: 10.w,
//                                     ),
//                                     Text(
//                                       order["cargo"],
//                                       style: TextStyle(
//                                         color: AppConstant.primaryColor,
//                                         fontSize: 20.sp,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     Text(
//                                      order["capacity"].toString()+ " "+ order["unit"],
//                                       style: TextStyle(
//                                         color: AppConstant.primaryColor,
//                                         fontSize: 20.sp,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 5.w,
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                              padding:  EdgeInsets.symmetric(vertical: 8.h),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Icon(
//                                   CupertinoIcons.money_dollar_circle_fill,
//                                   color: AppConstant.primaryColor,
//                                   size: 32,
//                                 ),
//                                 SizedBox(
//                                   width: 10.w,
//                                 ),
//                                 Text(
//                                   toMoney(order["price"].toInt())+" so'm",
//                                   style: TextStyle(
//                                     color: AppConstant.primaryColor,
//                                     fontSize: 20.sp,
//                                     fontWeight: FontWeight.w700,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           // Row(
//                           //   mainAxisSize: MainAxisSize.min,
//                           //   mainAxisAlignment: MainAxisAlignment.start,
//                           //   crossAxisAlignment: CrossAxisAlignment.start,
//                           //   children: [
//                           //     Icon(
//                           //       CupertinoIcons.chat_bubble_text_fill,
//                           //       color: AppConstant.primaryColor,
//                           //       size: 32,
//                           //     ),
//                           //     SizedBox(
//                           //       width: 10.w,
//                           //     ),
//                               // SizedBox(
//                               //   width: 195.w,
//                               //   child: Text(
//                               //     "Assalomu alaykum shunga uxshash gaplar",
//                               //     style: TextStyle(
//                               //       color: AppConstant.primaryColor,
//                               //       fontSize: 20.sp,
//                               //       fontWeight: FontWeight.w700,
//                               //     ),
//                               //   ),
//                               // ),
//                           //   ],
//                           // ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                        padding:  EdgeInsets.symmetric(vertical: 16.h),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               Navigator.pop(context);
//                               channel.sink.add(jsonEncode(command));
                              
//                             },
//                             child: Container(
//                               padding: EdgeInsets.symmetric(
//                                 vertical: 6.h,
//                                 horizontal: 9.w,
//                               ),
//                               decoration: BoxDecoration(
//                                 color: AppConstant.primaryColor,
//                                 borderRadius: BorderRadius.only(
//                                   bottomLeft: Radius.circular(10.r),
//                                   topRight: Radius.circular(
//                                     10.r,
//                                   ),
//                                 ),
//                               ),
//                               child: Text(
//                                 "Buyurtmani olish".tr(),
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 12.sp),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 15.w,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
