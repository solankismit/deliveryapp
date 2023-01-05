import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Api.dart';
import '../modle/Order_History_Model.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  var status = "Processing";
  var price = "5050.00";
  var id = "#100070";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Order History',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<Order_History_Model>(
            future: Order_History().OrderHistorylist(),
            builder: (context, snapshots) {
              return (snapshots.hasData)
                  ? Container(
                      // padding: EdgeInsets.only(bottom: 10),
                      // height: 590.h,
                      decoration: new BoxDecoration(
                        color: const Color(0xffe9eaec),
                      ),
                      child: ListView.builder(
                        itemCount: snapshots.data!.data!.length,
                          itemBuilder:(context, index) {
                            var server = snapshots.data!.data![index];
                            var time = server.ordermaster![0].orderDateTime.toString();

                            return  Column(
                              children: [
                                Container(
                                  height: 75.h,
                                  width: 330.w,
                                  margin: EdgeInsets.only(top: 10.h),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(10.r),
                                      color: Colors.white),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 7.h),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 15.w,
                                            ),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      'Order ID:',
                                                      style:
                                                      GoogleFonts.roboto(
                                                          textStyle:
                                                          TextStyle(
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                          )),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  Container(

                                                    child: Text(
                                                        server.oid.toString().length > 10
                                                          ? "${server.oid.toString().substring(0, 9)}"
                                                          : server.oid.toString() + "...",

                                                      style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 115.w,
                                            ),
                                            Container(
                                              child: Text(
                                                'Amount',
                                                style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                      fontSize: 15.sp,
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 7.h),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 15.w,
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      'Status:',
                                                      style:
                                                      GoogleFonts.roboto(
                                                          textStyle:
                                                          TextStyle(
                                                            fontSize: 15.sp,
                                                          )),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      server.deliveryStatus.toString(),
                                                      style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        color: Colors.blue,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 140.w,
                                            ),
                                            Container(
                                              child: Text(
                                                server.pprice.toString(),
                                                style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                      fontSize: 15.sp,
                                                      color: Colors.blue,
                                                      fontWeight: FontWeight.bold,
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 7.h),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 15.w,
                                            ),
                                            Icon(
                                              Icons.circle,
                                              size: 13.r,
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Text(
                                              'Order at $time ',
                                              style: GoogleFonts.roboto(
                                                  textStyle: TextStyle(
                                                    fontSize: 13.sp,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Column(
                                //   children: [
                                //     Container(
                                //       height: 75.h,
                                //       width: 330.w,
                                //       margin: EdgeInsets.only(top: 10.h),
                                //       decoration: BoxDecoration(
                                //           borderRadius:
                                //           BorderRadius.circular(10.r),
                                //           color: Colors.white),
                                //       child: Column(
                                //         children: [
                                //           Container(
                                //             margin: EdgeInsets.only(top: 7.h),
                                //             child: Row(
                                //               children: [
                                //                 SizedBox(
                                //                   width: 15.w,
                                //                 ),
                                //                 Container(
                                //                   child: Row(
                                //                     children: [
                                //                       Container(
                                //                         child: Text(
                                //                           'Order ID:',
                                //                           style:
                                //                           GoogleFonts.roboto(
                                //                               textStyle:
                                //                               TextStyle(
                                //                                 fontSize: 13.sp,
                                //                                 fontWeight:
                                //                                 FontWeight.bold,
                                //                               )),
                                //                         ),
                                //                       ),
                                //                       SizedBox(
                                //                         width: 5.w,
                                //                       ),
                                //                       Container(
                                //                         child: Text(
                                //                           '$id',
                                //                           style: TextStyle(
                                //                             fontWeight:
                                //                             FontWeight.bold,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                 ),
                                //                 SizedBox(
                                //                   width: 115.w,
                                //                 ),
                                //                 Container(
                                //                   child: Text(
                                //                     'Amount',
                                //                     style: GoogleFonts.roboto(
                                //                         textStyle: TextStyle(
                                //                           fontSize: 15.sp,
                                //                         )),
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //           Container(
                                //             margin: EdgeInsets.only(top: 7.h),
                                //             child: Row(
                                //               children: [
                                //                 Container(
                                //                   child: Row(
                                //                     children: [
                                //                       SizedBox(
                                //                         width: 15.w,
                                //                       ),
                                //                       Container(
                                //                         child: Text(
                                //                           'Status:',
                                //                           style:
                                //                           GoogleFonts.roboto(
                                //                               textStyle:
                                //                               TextStyle(
                                //                                 fontSize: 15.sp,
                                //                               )),
                                //                         ),
                                //                       ),
                                //                       SizedBox(
                                //                         width: 5.w,
                                //                       ),
                                //                       Container(
                                //                         child: Text(
                                //                           '$status',
                                //                           style: TextStyle(
                                //                             fontWeight:
                                //                             FontWeight.bold,
                                //                             color: Colors.blue,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                 ),
                                //                 SizedBox(
                                //                   width: 100.w,
                                //                 ),
                                //                 Container(
                                //                   child: Text(
                                //                     '\$ $price',
                                //                     style: GoogleFonts.roboto(
                                //                         textStyle: TextStyle(
                                //                           fontSize: 15.sp,
                                //                           color: Colors.blue,
                                //                           fontWeight: FontWeight.bold,
                                //                         )),
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //           Container(
                                //             margin: EdgeInsets.only(top: 7.h),
                                //             child: Row(
                                //               children: [
                                //                 SizedBox(
                                //                   width: 15.w,
                                //                 ),
                                //                 Icon(
                                //                   Icons.circle,
                                //                   size: 13.r,
                                //                 ),
                                //                 SizedBox(
                                //                   width: 10.w,
                                //                 ),
                                //                 Text(
                                //                   'Order at $time | ',
                                //                   style: GoogleFonts.roboto(
                                //                       textStyle: TextStyle(
                                //                         fontSize: 13.sp,
                                //                       )),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Column(
                                //   children: [
                                //     Container(
                                //       height: 75.h,
                                //       width: 330.w,
                                //       margin: EdgeInsets.only(top: 10.h),
                                //       decoration: BoxDecoration(
                                //           borderRadius:
                                //           BorderRadius.circular(10.r),
                                //           color: Colors.white),
                                //       child: Column(
                                //         children: [
                                //           Container(
                                //             margin: EdgeInsets.only(top: 7.h),
                                //             child: Row(
                                //               children: [
                                //                 SizedBox(
                                //                   width: 15.w,
                                //                 ),
                                //                 Container(
                                //                   child: Row(
                                //                     children: [
                                //                       Container(
                                //                         child: Text(
                                //                           'Order ID:',
                                //                           style:
                                //                           GoogleFonts.roboto(
                                //                               textStyle:
                                //                               TextStyle(
                                //                                 fontSize: 13.sp,
                                //                                 fontWeight:
                                //                                 FontWeight.bold,
                                //                               )),
                                //                         ),
                                //                       ),
                                //                       SizedBox(
                                //                         width: 5.w,
                                //                       ),
                                //                       Container(
                                //                         child: Text(
                                //                           '$id',
                                //                           style: TextStyle(
                                //                             fontWeight:
                                //                             FontWeight.bold,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                 ),
                                //                 SizedBox(
                                //                   width: 115.w,
                                //                 ),
                                //                 Container(
                                //                   child: Text(
                                //                     'Amount',
                                //                     style: GoogleFonts.roboto(
                                //                         textStyle: TextStyle(
                                //                           fontSize: 15.sp,
                                //                         )),
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //           Container(
                                //             margin: EdgeInsets.only(top: 7.h),
                                //             child: Row(
                                //               children: [
                                //                 Container(
                                //                   child: Row(
                                //                     children: [
                                //                       SizedBox(
                                //                         width: 15.w,
                                //                       ),
                                //                       Container(
                                //                         child: Text(
                                //                           'Status:',
                                //                           style:
                                //                           GoogleFonts.roboto(
                                //                               textStyle:
                                //                               TextStyle(
                                //                                 fontSize: 15.sp,
                                //                               )),
                                //                         ),
                                //                       ),
                                //                       SizedBox(
                                //                         width: 5.w,
                                //                       ),
                                //                       Container(
                                //                         child: Text(
                                //                           '$status',
                                //                           style: TextStyle(
                                //                             fontWeight:
                                //                             FontWeight.bold,
                                //                             color: Colors.blue,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                 ),
                                //                 SizedBox(
                                //                   width: 100.w,
                                //                 ),
                                //                 Container(
                                //                   child: Text(
                                //                     '\$ $price',
                                //                     style: GoogleFonts.roboto(
                                //                         textStyle: TextStyle(
                                //                           fontSize: 15.sp,
                                //                           color: Colors.blue,
                                //                           fontWeight: FontWeight.bold,
                                //                         )),
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //           Container(
                                //             margin: EdgeInsets.only(top: 7.h),
                                //             child: Row(
                                //               children: [
                                //                 SizedBox(
                                //                   width: 15.w,
                                //                 ),
                                //                 Icon(
                                //                   Icons.circle,
                                //                   size: 13.r,
                                //                 ),
                                //                 SizedBox(
                                //                   width: 10.w,
                                //                 ),
                                //                 Text(
                                //                   'Order at $time | ',
                                //                   style: GoogleFonts.roboto(
                                //                       textStyle: TextStyle(
                                //                         fontSize: 13.sp,
                                //                       )),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Column(
                                //   children: [
                                //     Container(
                                //       height: 75.h,
                                //       width: 330.w,
                                //       margin: EdgeInsets.only(top: 10.h),
                                //       decoration: BoxDecoration(
                                //           borderRadius:
                                //           BorderRadius.circular(10.r),
                                //           color: Colors.white),
                                //       child: Column(
                                //         children: [
                                //           Container(
                                //             margin: EdgeInsets.only(top: 7.h),
                                //             child: Row(
                                //               children: [
                                //                 SizedBox(
                                //                   width: 15.w,
                                //                 ),
                                //                 Container(
                                //                   child: Row(
                                //                     children: [
                                //                       Container(
                                //                         child: Text(
                                //                           'Order ID:',
                                //                           style:
                                //                           GoogleFonts.roboto(
                                //                               textStyle:
                                //                               TextStyle(
                                //                                 fontSize: 13.sp,
                                //                                 fontWeight:
                                //                                 FontWeight.bold,
                                //                               )),
                                //                         ),
                                //                       ),
                                //                       SizedBox(
                                //                         width: 5.w,
                                //                       ),
                                //                       Container(
                                //                         child: Text(
                                //                           '$id',
                                //                           style: TextStyle(
                                //                             fontWeight:
                                //                             FontWeight.bold,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                 ),
                                //                 SizedBox(
                                //                   width: 115.w,
                                //                 ),
                                //                 Container(
                                //                   child: Text(
                                //                     'Amount',
                                //                     style: GoogleFonts.roboto(
                                //                         textStyle: TextStyle(
                                //                           fontSize: 15.sp,
                                //                         )),
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //           Container(
                                //             margin: EdgeInsets.only(top: 7.h),
                                //             child: Row(
                                //               children: [
                                //                 Container(
                                //                   child: Row(
                                //                     children: [
                                //                       SizedBox(
                                //                         width: 15.w,
                                //                       ),
                                //                       Container(
                                //                         child: Text(
                                //                           'Status:',
                                //                           style:
                                //                           GoogleFonts.roboto(
                                //                               textStyle:
                                //                               TextStyle(
                                //                                 fontSize: 15.sp,
                                //                               )),
                                //                         ),
                                //                       ),
                                //                       SizedBox(
                                //                         width: 5.w,
                                //                       ),
                                //                       Container(
                                //                         child: Text(
                                //                           '$status',
                                //                           style: TextStyle(
                                //                             fontWeight:
                                //                             FontWeight.bold,
                                //                             color: Colors.blue,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                 ),
                                //                 SizedBox(
                                //                   width: 100.w,
                                //                 ),
                                //                 Container(
                                //                   child: Text(
                                //                     '\$ $price',
                                //                     style: GoogleFonts.roboto(
                                //                         textStyle: TextStyle(
                                //                           fontSize: 15.sp,
                                //                           color: Colors.blue,
                                //                           fontWeight: FontWeight.bold,
                                //                         )),
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //           Container(
                                //             margin: EdgeInsets.only(top: 7.h),
                                //             child: Row(
                                //               children: [
                                //                 SizedBox(
                                //                   width: 15.w,
                                //                 ),
                                //                 Icon(
                                //                   Icons.circle,
                                //                   size: 13.r,
                                //                 ),
                                //                 SizedBox(
                                //                   width: 10.w,
                                //                 ),
                                //                 Text(
                                //                   'Order at $time | ',
                                //                   style: GoogleFonts.roboto(
                                //                       textStyle: TextStyle(
                                //                         fontSize: 13.sp,
                                //                       )),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Column(
                                //   children: [
                                //     Container(
                                //       height: 75.h,
                                //       width: 330.w,
                                //       margin: EdgeInsets.only(top: 10.h),
                                //       decoration: BoxDecoration(
                                //           borderRadius:
                                //           BorderRadius.circular(10.r),
                                //           color: Colors.white),
                                //       child: Column(
                                //         children: [
                                //           Container(
                                //             margin: EdgeInsets.only(top: 7.h),
                                //             child: Row(
                                //               children: [
                                //                 SizedBox(
                                //                   width: 15.w,
                                //                 ),
                                //                 Container(
                                //                   child: Row(
                                //                     children: [
                                //                       Container(
                                //                         child: Text(
                                //                           'Order ID:',
                                //                           style:
                                //                           GoogleFonts.roboto(
                                //                               textStyle:
                                //                               TextStyle(
                                //                                 fontSize: 13.sp,
                                //                                 fontWeight:
                                //                                 FontWeight.bold,
                                //                               )),
                                //                         ),
                                //                       ),
                                //                       SizedBox(
                                //                         width: 5.w,
                                //                       ),
                                //                       Container(
                                //                         child: Text(
                                //                           '$id',
                                //                           style: TextStyle(
                                //                             fontWeight:
                                //                             FontWeight.bold,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                 ),
                                //                 SizedBox(
                                //                   width: 115.w,
                                //                 ),
                                //                 Container(
                                //                   child: Text(
                                //                     'Amount',
                                //                     style: GoogleFonts.roboto(
                                //                         textStyle: TextStyle(
                                //                           fontSize: 15.sp,
                                //                         )),
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //           Container(
                                //             margin: EdgeInsets.only(top: 7.h),
                                //             child: Row(
                                //               children: [
                                //                 Container(
                                //                   child: Row(
                                //                     children: [
                                //                       SizedBox(
                                //                         width: 15.w,
                                //                       ),
                                //                       Container(
                                //                         child: Text(
                                //                           'Status:',
                                //                           style:
                                //                           GoogleFonts.roboto(
                                //                               textStyle:
                                //                               TextStyle(
                                //                                 fontSize: 15.sp,
                                //                               )),
                                //                         ),
                                //                       ),
                                //                       SizedBox(
                                //                         width: 5.w,
                                //                       ),
                                //                       Container(
                                //                         child: Text(
                                //                           '$status',
                                //                           style: TextStyle(
                                //                             fontWeight:
                                //                             FontWeight.bold,
                                //                             color: Colors.blue,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                 ),
                                //                 SizedBox(
                                //                   width: 100.w,
                                //                 ),
                                //                 Container(
                                //                   child: Text(
                                //                     '\$ $price',
                                //                     style: GoogleFonts.roboto(
                                //                         textStyle: TextStyle(
                                //                           fontSize: 15.sp,
                                //                           color: Colors.blue,
                                //                           fontWeight: FontWeight.bold,
                                //                         )),
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //           Container(
                                //             margin: EdgeInsets.only(top: 7.h),
                                //             child: Row(
                                //               children: [
                                //                 SizedBox(
                                //                   width: 15.w,
                                //                 ),
                                //                 Icon(
                                //                   Icons.circle,
                                //                   size: 13.r,
                                //                 ),
                                //                 SizedBox(
                                //                   width: 10.w,
                                //                 ),
                                //                 Text(
                                //                   'Order at $time | ',
                                //                   style: GoogleFonts.roboto(
                                //                       textStyle: TextStyle(
                                //                         fontSize: 13.sp,
                                //                       )),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Column(
                                //   children: [
                                //     Container(
                                //       height: 75.h,
                                //       width: 330.w,
                                //       margin: EdgeInsets.only(top: 10.h),
                                //       decoration: BoxDecoration(
                                //           borderRadius:
                                //           BorderRadius.circular(10.r),
                                //           color: Colors.white),
                                //       child: Column(
                                //         children: [
                                //           Container(
                                //             margin: EdgeInsets.only(top: 7.h),
                                //             child: Row(
                                //               children: [
                                //                 SizedBox(
                                //                   width: 15.w,
                                //                 ),
                                //                 Container(
                                //                   child: Row(
                                //                     children: [
                                //                       Container(
                                //                         child: Text(
                                //                           'Order ID:',
                                //                           style:
                                //                           GoogleFonts.roboto(
                                //                               textStyle:
                                //                               TextStyle(
                                //                                 fontSize: 13.sp,
                                //                                 fontWeight:
                                //                                 FontWeight.bold,
                                //                               )),
                                //                         ),
                                //                       ),
                                //                       SizedBox(
                                //                         width: 5.w,
                                //                       ),
                                //                       Container(
                                //                         child: Text(
                                //                           '$id',
                                //                           style: TextStyle(
                                //                             fontWeight:
                                //                             FontWeight.bold,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                 ),
                                //                 SizedBox(
                                //                   width: 115.w,
                                //                 ),
                                //                 Container(
                                //                   child: Text(
                                //                     'Amount',
                                //                     style: GoogleFonts.roboto(
                                //                         textStyle: TextStyle(
                                //                           fontSize: 15.sp,
                                //                         )),
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //           Container(
                                //             margin: EdgeInsets.only(top: 7.h),
                                //             child: Row(
                                //               children: [
                                //                 Container(
                                //                   child: Row(
                                //                     children: [
                                //                       SizedBox(
                                //                         width: 15.w,
                                //                       ),
                                //                       Container(
                                //                         child: Text(
                                //                           'Status:',
                                //                           style:
                                //                           GoogleFonts.roboto(
                                //                               textStyle:
                                //                               TextStyle(
                                //                                 fontSize: 15.sp,
                                //                               )),
                                //                         ),
                                //                       ),
                                //                       SizedBox(
                                //                         width: 5.w,
                                //                       ),
                                //                       Container(
                                //                         child: Text(
                                //                           '$status',
                                //                           style: TextStyle(
                                //                             fontWeight:
                                //                             FontWeight.bold,
                                //                             color: Colors.blue,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                 ),
                                //                 SizedBox(
                                //                   width: 100.w,
                                //                 ),
                                //                 Container(
                                //                   child: Text(
                                //                     '\$ $price',
                                //                     style: GoogleFonts.roboto(
                                //                         textStyle: TextStyle(
                                //                           fontSize: 15.sp,
                                //                           color: Colors.blue,
                                //                           fontWeight: FontWeight.bold,
                                //                         )),
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //           Container(
                                //             margin: EdgeInsets.only(top: 7.h),
                                //             child: Row(
                                //               children: [
                                //                 SizedBox(
                                //                   width: 15.w,
                                //                 ),
                                //                 Icon(
                                //                   Icons.circle,
                                //                   size: 13.r,
                                //                 ),
                                //                 SizedBox(
                                //                   width: 10.w,
                                //                 ),
                                //                 Text(
                                //                   'Order at $time | ',
                                //                   style: GoogleFonts.roboto(
                                //                       textStyle: TextStyle(
                                //                         fontSize: 13.sp,
                                //                       )),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Column(
                                //   children: [
                                //     Container(
                                //       height: 75.h,
                                //       width: 330.w,
                                //       margin: EdgeInsets.only(top: 10.h),
                                //       decoration: BoxDecoration(
                                //           borderRadius:
                                //           BorderRadius.circular(10.r),
                                //           color: Colors.white),
                                //       child: Column(
                                //         children: [
                                //           Container(
                                //             margin: EdgeInsets.only(top: 7.h),
                                //             child: Row(
                                //               children: [
                                //                 SizedBox(
                                //                   width: 15.w,
                                //                 ),
                                //                 Container(
                                //                   child: Row(
                                //                     children: [
                                //                       Container(
                                //                         child: Text(
                                //                           'Order ID:',
                                //                           style:
                                //                           GoogleFonts.roboto(
                                //                               textStyle:
                                //                               TextStyle(
                                //                                 fontSize: 13.sp,
                                //                                 fontWeight:
                                //                                 FontWeight.bold,
                                //                               )),
                                //                         ),
                                //                       ),
                                //                       SizedBox(
                                //                         width: 5.w,
                                //                       ),
                                //                       Container(
                                //                         child: Text(
                                //                           '$id',
                                //                           style: TextStyle(
                                //                             fontWeight:
                                //                             FontWeight.bold,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                 ),
                                //                 SizedBox(
                                //                   width: 115.w,
                                //                 ),
                                //                 Container(
                                //                   child: Text(
                                //                     'Amount',
                                //                     style: GoogleFonts.roboto(
                                //                         textStyle: TextStyle(
                                //                           fontSize: 15.sp,
                                //                         )),
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //           Container(
                                //             margin: EdgeInsets.only(top: 7.h),
                                //             child: Row(
                                //               children: [
                                //                 Container(
                                //                   child: Row(
                                //                     children: [
                                //                       SizedBox(
                                //                         width: 15.w,
                                //                       ),
                                //                       Container(
                                //                         child: Text(
                                //                           'Status:',
                                //                           style:
                                //                           GoogleFonts.roboto(
                                //                               textStyle:
                                //                               TextStyle(
                                //                                 fontSize: 15.sp,
                                //                               )),
                                //                         ),
                                //                       ),
                                //                       SizedBox(
                                //                         width: 5.w,
                                //                       ),
                                //                       Container(
                                //                         child: Text(
                                //                           '$status',
                                //                           style: TextStyle(
                                //                             fontWeight:
                                //                             FontWeight.bold,
                                //                             color: Colors.blue,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                 ),
                                //                 SizedBox(
                                //                   width: 100.w,
                                //                 ),
                                //                 Container(
                                //                   child: Text(
                                //                     '\$ $price',
                                //                     style: GoogleFonts.roboto(
                                //                         textStyle: TextStyle(
                                //                           fontSize: 15.sp,
                                //                           color: Colors.blue,
                                //                           fontWeight: FontWeight.bold,
                                //                         )),
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //           Container(
                                //             margin: EdgeInsets.only(top: 7.h),
                                //             child: Row(
                                //               children: [
                                //                 SizedBox(
                                //                   width: 15.w,
                                //                 ),
                                //                 Icon(
                                //                   Icons.circle,
                                //                   size: 13.r,
                                //                 ),
                                //                 SizedBox(
                                //                   width: 10.w,
                                //                 ),
                                //                 Text(
                                //                   'Order at $time | ',
                                //                   style: GoogleFonts.roboto(
                                //                       textStyle: TextStyle(
                                //                         fontSize: 13.sp,
                                //                       )),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            );
                        }
                      ),
                    )
                  : Center(child: CircularProgressIndicator());
            }));
  }
}
