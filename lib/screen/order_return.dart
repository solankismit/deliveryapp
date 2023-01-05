import 'package:delivery_boy/screen/pickup_order_otpscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Api.dart';
import '../modle/Order_Display_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modle/pickup_order_detils_model.dart';
import '../modle/view_details_model.dart';
import 'otp_verification_screen.dart';
class orderreturn extends StatefulWidget {
  const orderreturn({Key? key}) : super(key: key);

  @override
  State<orderreturn> createState() => _orderreturnState();
}

class _orderreturnState extends State<orderreturn> {
  //String pid = "";
  //String orderId = "";
  String pickupId="";
  // String orderid = "";
  // String orderdate = "";

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController _phoneController = TextEditingController();
  String  phoneNumber = "";
  String phoneNo = "";

  // String tempToken = "";
  // String mobileNumber = "";
  // String email = "";
  void initState() {
    super.initState();
    loaddata();
    _formKey = GlobalKey<FormState>();
  }

  late GlobalKey<FormState> _formKey;
  void loaddata() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      pickupId = (prefs.getString("pickupId"))!;
      phoneNo = (prefs.getString("phoneNo"))!;

      // pickupId = (prefs.getString("pickupId"))!;
      //orderid = (prefs.getString("orderid"))!;
      //orderdate = (prefs.getString("orderdate"))!;
      print(pickupId + "==============>ankit");
      print(phoneNo + "==============>ankit");
      //print(pickupId + "==============>ankit");
      //print(orderid + "==============>ankit");
      //print(orderdate + "==============>ankit");

    });
  }


  var time = "10:18 AM";
  var date = "26-Jun-2022";
  var address = "20 Rd No. 14A, Dhaka 1209, Bangladesh Dhaka 125 Bangladesh";
  int no = 1;
  double price = 5050.00;
  int gt = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffe9eaec),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10.h, left: 10.w),
                child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(
                      'Order return',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
                    ),
                  ],

                ),
              ),
              SizedBox(height: 10.h,),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Text(
                                'Order ID:',
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      fontSize: 15.sp,
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Container(
                              child: Text(
                                '# 100070',
                                // snapshots.data!.data![0].oid.toString().length > 10
                                //     ? "${snapshots.data!.data![0].oid.toString().substring(0, 9)}"
                                //     : snapshots.data!.data![0].oid.toString() + "...",

                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 20.sp,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "28-09-2022",
                              //'${snapshots.data!.data![0].ordermaster![0].orderDateTime.toString()} | ',
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontSize: 12.sp,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    height: 200.h,
                    width: 340.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r), color: Colors.white),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 15.w,
                              ),
                              Container(
                                  child: Text(
                                    'Customer',
                                    style: TextStyle(fontSize: 11.sp),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(right: 50.w),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 50.h,
                                      width: 70.w,
                                      color: Colors.white,
                                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBkgtST60zI1hhnOhBDhCDFLnY_pw_e2lxDBpV0GI&s"),
                                    ),
                                    SizedBox(
                                      width: 25.w,
                                    ),
                                    Container(
                                      width: 140.w,
                                      child: Text(
                                        'fatema subarena',
                                        //  snapshots.data!.data![0].ordermaster![0].customerName.toString(),
                                        style: TextStyle(fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 35.h,
                                    width: 40.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: const Color(0xffe9eaec),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.phone,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(child: Text('Order Note : ')),
                            ],
                          ),
                          SizedBox(
                            height: 13.h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                width: 330.w,
                                child: Text(
                                  'Shipping Address : '
                                  //'${snapshots.data!.data![0].ordermaster![0].orderAddress.toString()}'
                                      'ahemdabad',
                                  style: GoogleFonts.numans(
                                    textStyle: TextStyle(
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                width: 330.w,
                                child: Text(
                                  'Billing Address : ahemdabad',
                                  //'$address',
                                  style: GoogleFonts.numans(
                                    textStyle: TextStyle(
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    height: 200.h,
                    width: 340.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.white),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 8.w,
                              ),
                              Container(
                                  child: Text(
                                    'Vender Ditails',
                                    style: TextStyle(fontSize: 11.sp,fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(right: 200.w),
                                child: Container(
                                  height: 50.h,
                                  width: 70.w,
                                  color: Colors.white,
                                  child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBkgtST60zI1hhnOhBDhCDFLnY_pw_e2lxDBpV0GI&s"),
                                ),
                              ),
                              SizedBox(
                                width: 25.w,
                              ),

                              Row(
                                children: [

                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                  child: Text('email_address :${"AnkitChangela@gmail.com"} ')),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                width: 330.w,
                                child: Text(
                                  'company_name : ${"Webearl"}',
                                  style: GoogleFonts.numans(
                                    textStyle: TextStyle(
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                width: 330.w,
                                child: Text(
                                  'vendor_contact : ${"8511622062"}',
                                  style: GoogleFonts.numans(
                                    textStyle: TextStyle(
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                width: 330.w,
                                child: Text(
                                  'vendor_address : ${"ahemdabad"}',
                                  style: GoogleFonts.numans(
                                    textStyle: TextStyle(
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                width: 330.w,
                                child: Text(
                                  'first_name : ${"Ankit"}',
                                  style: GoogleFonts.numans(
                                    textStyle: TextStyle(
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                width: 330.w,
                                child: Text(
                                  'last_name : ${"Changela"}',
                                  style: GoogleFonts.numans(
                                    textStyle: TextStyle(
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8.h),
                    child: Row(
                      children: [
                        Text(
                          'Item : ',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        Text(
                          '$no',
                          style: TextStyle(
                              color: Colors.blue[500],
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 0.8,
                    color: Colors.black54,
                    indent: 7,
                    endIndent: 10,
                  ),
      Container(
        height: 120.h,
        child: Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            Padding(
              padding:  EdgeInsets.only(bottom: 30.h),
              child: Container(
                height: 50.h,
                width: 70.w,
                color: const Color(0xffe9eaec),
               // child: Image.network('https://d5nunyagcicgy.cloudfront.net/external_assets/hero_examples/hair_beach_v391182663/original.jpeg'),
                child: Image.network("https://images.unsplash.com/photo-1517142089942-ba376ce32a2e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fHByb2R1Y3R8ZW58MHx8MHx8&w=1000&q=80"),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Container(
              height: 100.h,
              width: 190.w,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5.h),
                    height: 25.h,
                    width: 180.w,
                    child: Text(
                      '$address',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 11.sp),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            'Quantity: ',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '$no',
                           // server.qty.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5.w, top: 3.h),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Amethyst-s',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )),

                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: 90.w,top: 5.h),
                    child: InkWell(
                      onTap: () async{
                        // continueClick();
                        final SharedPreferences prefs =  await _prefs;

                        // phoneNo = _phoneController.text.trim();
                        // print(phoneNo + ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                        //print( MobileNO??"" + "><><><><><><>");

                        //prefs.setString("phoneNo",phoneNo);
                        // print(phoneNo + ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");

                        FocusScope.of(context).requestFocus(new FocusNode());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Pickuporderotp(
                                  mobile:"8511622062",
                                  countrycode: "+91",
                                ),
                          ),
                        );
                      },
                      child: Container(

                        width: 90.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(10.r)
                        ),
                        child: Center(child: Text("OTP")),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.h),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      'Amount',

                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 15.sp,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    child: Text(
                      '\₹ $price',
                      //server.pprice.toString(),
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
          ],
        ),
      ),

                  Divider(
                    thickness: 0.8,
                    color: Colors.black54,
                    indent: 7,
                    endIndent: 10,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Items Price',
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        fontSize: 17.sp,
                                      )),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '$price',
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        fontSize: 17.sp,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 3.h),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Tax',
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        fontSize: 17.sp,
                                      )),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '(+) $price',
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        fontSize: 17.sp,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  DottedLine(
                    dashLength: 7,
                    dashGapLength: 5,
                    lineThickness: 1,
                    lineLength: 345.w,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 3.h),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'SubTotal',
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  ' $price',
                                  // snapshots.data!.data![0].pprice.toString(),
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 3.h),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Discount',
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        fontSize: 17.sp,
                                      )),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '(-) $price',
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        fontSize: 17.sp,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 3.h),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Coupon Discount',
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        fontSize: 17.sp,
                                      )),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '(-) \₹ $price',
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        fontSize: 17.sp,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 3.h),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Shipping Fee',
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        fontSize: 17.sp,
                                      )),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '(+) \₹ $price',
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        fontSize: 17.sp,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  DottedLine(
                    dashLength: 7,
                    dashGapLength: 5,
                    lineThickness: 1,
                    lineLength: 345.w,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Total Amount',
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                )),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '\₹ ${price}',
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                )),
                          ),
                        ),
                      ],
                    ),

                  ),
                  InkWell(
                    onTap: (){

                    },
                    child: Container(
                      height: 35.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: Colors.blue,borderRadius: BorderRadius.all(Radius.circular(5.r))
                      ),
                      child: Center(child: Text("updatestatus",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15.sp),)),
                    ),
                  ),
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
  continueClick() async{




  }
}

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:dotted_line/dotted_line.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class ViewDetailsScreen extends StatefulWidget {
//   const ViewDetailsScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ViewDetailsScreen> createState() => _ViewDetailsScreenState();
// }
//
// class _ViewDetailsScreenState extends State<ViewDetailsScreen> {
//   var time = "10:18 AM";
//   var date = "26-Jun-2022";
//   var address = "20 Rd No. 14A, Dhaka 1209, Bangladesh Dhaka 125 Bangladesh";
//   int no = 1;
//   double price = 5050.00;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffe9eaec),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 margin: EdgeInsets.only(top: 10.h, left: 10.w),
//                 child: Row(
//                   children: [
//                     IconButton(
//                       icon: Icon(
//                         Icons.arrow_back_ios,
//                         color: Colors.black,
//                       ),
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                     ),
//                     SizedBox(
//                       width: 70.w,
//                     ),
//                     Text(
//                       'Order Details',
//                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 8.h),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           child: Text(
//                             'Order ID:',
//                             style: GoogleFonts.lato(
//                                 textStyle: TextStyle(
//                                   fontSize: 15.sp,
//                                 )),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 10.w,
//                         ),
//                         Container(
//                           child: Text(
//                             '# 100070',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.access_time,
//                           size: 20.sp,
//                           color: Colors.black,
//                         ),
//                         SizedBox(
//                           width: 5.w,
//                         ),
//                         Text(
//                           '$time | $date',
//                           style: GoogleFonts.roboto(
//                               textStyle: TextStyle(
//                                 fontSize: 12.sp,
//                               )),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 5.h,
//               ),
//               Container(
//                 height: 200.h,
//                 width: 340.w,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.r), color: Colors.white),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 5.h,
//                       ),
//                       Row(
//                         children: [
//                           SizedBox(
//                             width: 15.w,
//                           ),
//                           Container(
//                               child: Text(
//                                 'Customer',
//                                 style: TextStyle(fontSize: 11.sp),
//                               )),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10.h,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Row(
//                             children: [
//                               Container(
//                                 height: 50.h,
//                                 width: 70.w,
//                                 color: Colors.white,
//                                 child: Image.network(
//                                     'https://d5nunyagcicgy.cloudfront.net/external_assets/hero_examples/hair_beach_v391182663/original.jpeg'),
//                               ),
//                               SizedBox(
//                                 width: 25.w,
//                               ),
//                               Container(
//                                 width: 140.w,
//                                 child: Text(
//                                   'fatema subarena',
//                                   style: TextStyle(fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Container(
//                                 height: 35.h,
//                                 width: 40.w,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20.r),
//                                   color: const Color(0xffe9eaec),
//                                 ),
//                                 child: IconButton(
//                                   icon: Icon(
//                                     Icons.phone,
//                                     color: Colors.black,
//                                   ),
//                                   onPressed: () {},
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 15.h,
//                       ),
//                       Row(
//                         children: [
//                           SizedBox(
//                             width: 10.w,
//                           ),
//                           Container(child: Text('Order Note : ')),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 13.h,
//                       ),
//                       Row(
//                         children: [
//                           SizedBox(
//                             width: 10.w,
//                           ),
//                           Container(
//                             width: 330.w,
//                             child: Text(
//                               'Shipping Address : $address',
//                               style: GoogleFonts.numans(
//                                 textStyle: TextStyle(
//                                   fontSize: 13.sp,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10.h,
//                       ),
//                       Row(
//                         children: [
//                           SizedBox(
//                             width: 10.w,
//                           ),
//                           Container(
//                             width: 330.w,
//                             child: Text(
//                               'Billing Address : $address',
//                               style: GoogleFonts.numans(
//                                 textStyle: TextStyle(
//                                   fontSize: 13.sp,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 15.h,
//               ),
//               Container(
//                 margin: EdgeInsets.only(left: 8.h),
//                 child: Row(
//                   children: [
//                     Text(
//                       'Item : ',
//                       style: TextStyle(fontSize: 18.sp),
//                     ),
//                     Text(
//                       '$no',
//                       style: TextStyle(
//                           color: Colors.blue[500],
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18.sp),
//                     ),
//                   ],
//                 ),
//               ),
//               Divider(
//                 thickness: 0.8,
//                 color: Colors.black54,
//                 indent: 7,
//                 endIndent: 10,
//               ),
//               Container(
//                 height: 70.h,
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       width: 10.w,
//                     ),
//                     Container(
//                       height: 50.h,
//                       width: 70.w,
//                       color: const Color(0xffe9eaec),
//                       child: Image.network(
//                           'https://d5nunyagcicgy.cloudfront.net/external_assets/hero_examples/hair_beach_v391182663/original.jpeg'),
//                     ),
//                     SizedBox(
//                       width: 10.w,
//                     ),
//                     Container(
//                       height: 80.h,
//                       width: 190.w,
//                       child: Column(
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(top: 5.h),
//                             height: 25.h,
//                             width: 180.w,
//                             child: Text(
//                               '$address',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 11.sp),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(left: 5.w),
//                             child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     'Quantity: ',
//                                     style: TextStyle(fontWeight: FontWeight.w500),
//                                   ),
//                                   Text(
//                                     '$no',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.blue),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(left: 5.w, top: 3.h),
//                             child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Text(
//                                   'Amethyst-s',
//                                   style: TextStyle(fontWeight: FontWeight.w500),
//                                 )),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(top: 10.h),
//                       child: Column(
//                         children: [
//                           Container(
//                             child: Text(
//                               'Amount',
//                               style: GoogleFonts.roboto(
//                                   textStyle: TextStyle(
//                                     fontSize: 15.sp,
//                                   )),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10.h,
//                           ),
//                           Container(
//                             child: Text(
//                               '\$ $price',
//                               style: GoogleFonts.roboto(
//                                   textStyle: TextStyle(
//                                     fontSize: 15.sp,
//                                     color: Colors.blue,
//                                     fontWeight: FontWeight.bold,
//                                   )),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Divider(
//                 thickness: 0.8,
//                 color: Colors.black54,
//                 indent: 7,
//                 endIndent: 10,
//               ),
//               Container(
//                 child: Column(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
//                       child: Stack(
//                         children: [
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               'Items Price',
//                               style: GoogleFonts.roboto(
//                                   textStyle: TextStyle(
//                                     fontSize: 17.sp,
//                                   )),
//                             ),
//                           ),
//                           Align(
//                             alignment: Alignment.centerRight,
//                             child: Text(
//                               '$price',
//                               style: GoogleFonts.roboto(
//                                   textStyle: TextStyle(
//                                     fontSize: 17.sp,
//                                   )),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 3.h),
//                       child: Stack(
//                         children: [
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               'Tax',
//                               style: GoogleFonts.roboto(
//                                   textStyle: TextStyle(
//                                     fontSize: 17.sp,
//                                   )),
//                             ),
//                           ),
//                           Align(
//                             alignment: Alignment.centerRight,
//                             child: Text(
//                               '(+) $price',
//                               style: GoogleFonts.roboto(
//                                   textStyle: TextStyle(
//                                     fontSize: 17.sp,
//                                   )),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               DottedLine(
//                 dashLength: 7,
//                 dashGapLength: 5,
//                 lineThickness: 1,
//                 lineLength: 345.w,
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 10, bottom: 10),
//                 child: Column(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 3.h),
//                       child: Stack(
//                         children: [
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               'SubTotal',
//                               style: GoogleFonts.roboto(
//                                   textStyle: TextStyle(
//                                     fontSize: 17.sp,
//                                     fontWeight: FontWeight.bold,
//                                   )),
//                             ),
//                           ),
//                           Align(
//                             alignment: Alignment.centerRight,
//                             child: Text(
//                               '\$ $price',
//                               style: GoogleFonts.roboto(
//                                   textStyle: TextStyle(
//                                     fontSize: 17.sp,
//                                     fontWeight: FontWeight.bold,
//                                   )),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 3.h),
//                       child: Stack(
//                         children: [
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               'Discount',
//                               style: GoogleFonts.roboto(
//                                   textStyle: TextStyle(
//                                     fontSize: 17.sp,
//                                   )),
//                             ),
//                           ),
//                           Align(
//                             alignment: Alignment.centerRight,
//                             child: Text(
//                               '(-) $price',
//                               style: GoogleFonts.roboto(
//                                   textStyle: TextStyle(
//                                     fontSize: 17.sp,
//                                   )),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 3.h),
//                       child: Stack(
//                         children: [
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               'Coupon Discount',
//                               style: GoogleFonts.roboto(
//                                   textStyle: TextStyle(
//                                     fontSize: 17.sp,
//                                   )),
//                             ),
//                           ),
//                           Align(
//                             alignment: Alignment.centerRight,
//                             child: Text(
//                               '(-) \$ $price',
//                               style: GoogleFonts.roboto(
//                                   textStyle: TextStyle(
//                                     fontSize: 17.sp,
//                                   )),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 3.h),
//                       child: Stack(
//                         children: [
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               'Shipping Fee',
//                               style: GoogleFonts.roboto(
//                                   textStyle: TextStyle(
//                                     fontSize: 17.sp,
//                                   )),
//                             ),
//                           ),
//                           Align(
//                             alignment: Alignment.centerRight,
//                             child: Text(
//                               '(+) \$ $price',
//                               style: GoogleFonts.roboto(
//                                   textStyle: TextStyle(
//                                     fontSize: 17.sp,
//                                   )),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               DottedLine(
//                 dashLength: 7,
//                 dashGapLength: 5,
//                 lineThickness: 1,
//                 lineLength: 345.w,
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
//                 child: Stack(
//                   children: [
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'Total Amount',
//                         style: GoogleFonts.roboto(
//                             textStyle: TextStyle(
//                               fontSize: 18.sp,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.blue,
//                             )),
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: Text(
//                         '\$ $price',
//                         style: GoogleFonts.roboto(
//                             textStyle: TextStyle(
//                               fontSize: 18.sp,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.blue,
//                             )),
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