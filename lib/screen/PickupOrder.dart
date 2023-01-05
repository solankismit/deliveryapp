import 'package:delivery_boy/screen/ViewDetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Api.dart';
import '../modle/pickuporder_display_model.dart';
import 'PickupViewDetails.dart';
import 'ViewDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';
class PickupOrderScreen extends StatefulWidget {
  const PickupOrderScreen({Key? key}) : super(key: key);

  @override
  State<PickupOrderScreen> createState() => _PickupOrderScreenState();
}

class _PickupOrderScreenState extends State<PickupOrderScreen> {

  String userphoto = "";
  String username = "";


  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();



  @override
  void initState() {
    super.initState();
    loaddata();
  }


  void loaddata() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      userphoto = (prefs.getString("userphoto"))!;
      username = (prefs.getString("username"))!;

      // brand_product_id = "6243eb1cf23aa4d9caf33abf";
      print(userphoto + "=============================>");
      print(username + "=============================>");
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:  Container(
          margin: EdgeInsets.only(left: 15.w),
          child: CircleAvatar(
            radius: 20.r,
            backgroundImage: NetworkImage(userphoto),
          ),
        ),

        title:  Text(
          username,
          style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.refresh),
            onPressed: (){},
            // tooltip: 'Show Snackbar',
            // onPressed: () {
            //   ScaffoldMessenger.of(context)
            //       .showSnackBar(SnackBar(content: Text('Utsav Desai')));
            // },
          ),
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.add),
            onPressed: (){},
            // tooltip: 'Show Snackbar',
            // onPressed: () {
            //   ScaffoldMessenger.of(context)
            //       .showSnackBar(SnackBar(content: Text('Utsav Desai')));
            // },
          ),
        ],
      ),
      body: Container(
        decoration: new BoxDecoration(
          color: const Color(0xffe9eaec),
        ),
        child:  Column(
          children: [
            Container(
              width: 340.w,
              margin: EdgeInsets.only(top: 10.h, left: 10.h, bottom: 10.h),
              child: Text(
                'Pickup Order',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Flexible(
              child: ListView(
                children: [
                  FutureBuilder<pickuporder_model>(
                      future: pickup_order().pickuporderlist(),
                      builder: (context, snapshots){
                        return (snapshots.hasData)?

                        Container(
                          height: 700.h,
                          child: ListView.builder(
                              itemCount: snapshots.data!.data!.length,
                              itemBuilder: (context,index){
                                var server =snapshots.data!.data![index];
                                return  Column(
                                  children: [
                                    Container(
                                      height: 150.h,
                                      width: 325.w,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.r),
                                          color: Colors.white),
                                      child: Column(
                                        children: [
                                          Stack(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    height: 25.h,
                                                    width: 75.w,
                                                    child: Align(
                                                      alignment: Alignment.center,
                                                      child: Text(
                                                        'Confirmed',
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 12.sp),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.only(
                                                          bottomLeft: Radius.circular(8.r),
                                                          topRight: Radius.circular(10.r)),
                                                      color: Color(0xff088bf5),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 10.h, left: 10.h),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      child: Text(
                                                        'Order ID:',
                                                        style: GoogleFonts.roboto(
                                                            textStyle: TextStyle(
                                                              fontSize: 15.sp,
                                                            )),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        //'# 100070',
                                                        server.sId.toString().length > 18
                                                            ? "${ server.sId.toString().substring(0, 18)}"
                                                            :  server.sId.toString() + "...",

                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 15.w,
                                              ),
                                              Icon(
                                                Icons.location_on,
                                              ),
                                              Container(
                                                width: 270.w,
                                                margin: EdgeInsets.only(left: 10.w),
                                                child: Text(
                                                  //'20 Rd No. 14A, Dhaka 1209, Bangladesh Dhaka 125 Bangladesh',
                                                  server.orderAddress.toString(),
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                        fontSize: 13.sp,
                                                      )),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 17.h,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              SizedBox(
                                                height: 40.h,
                                                width: 130.w,
                                                child: ElevatedButton(
                                                    onPressed: () async{
                                                      var pickupId = server.sId.toString();
                                                      //var orderid = server.sId.toString();
                                                      //var orderdate = server.ordermaster![0].orderDateTime.toString();

                                                      final SharedPreferences prefs = await _prefs;
                                                      prefs.setString("pickupId", pickupId);

                                                      print(pickupId + "============================>");

                                                      Navigator.push (
                                                        context,
                                                        MaterialPageRoute (
                                                          builder: (BuildContext context) => const PickupViewDetailsScreen(),
                                                        ),
                                                      );
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      primary: Colors.white,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(10.r),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      'View Details',
                                                      style: TextStyle(color: Colors.black),
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 40.h,
                                                width: 130.w,
                                                child: ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton.styleFrom(
                                                      primary: Colors.blue,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(10.r),
                                                      ),
                                                    ),
                                                    child: Text('Direction')),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
                                );


                              }
                          ),
                        ):Center(child: CircularProgressIndicator());



                      }
                  )



                ],

              ),
            ),
          ],
        )





      ),
    );
  }
}