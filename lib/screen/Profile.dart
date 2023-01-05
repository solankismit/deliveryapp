import 'package:delivery_boy/screen/Login.dart';
import 'package:delivery_boy/screen/PrivacyPolicy.dart';
import 'package:delivery_boy/screen/TermsCondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Api.dart';
import '../modle/Display_Profile_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
String userphoto = "";
String username = "";
String phoneNo = "";
String userToken = "";

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  void initState() {
    super.initState();
    loaddata(userphoto,username,phoneNo);
    data();
  }


  void loaddata(String userphoto,String username,String phoneNo) async {
    final SharedPreferences prefs = await  _prefs;  SharedPreferences;
    setState(() {
      prefs.setString("userphoto",userphoto);
      prefs.setString("username",username);
      prefs.setString("phoneNo",phoneNo);

      // brand_product_id = "6243eb1cf23aa4d9caf33abf";
      // print(userphoto + ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      // print(username + "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
      print("Ankit");
       print(phoneNo + "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
      print("Ankit");
    });
  }

void data () async{
  final SharedPreferences prefs = await  _prefs;
  setState(() {

    userToken = (prefs.getString("ut"))!;
    print((prefs.getString("ut"))!+"========================>jimmy");

    // address = prefs.getString("address");
    // zip = prefs.getString("zip");
    // city = prefs.getString("city");


  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffe9eaec),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 800,
              child: FutureBuilder<Display_Profile_model>(
                  future: Profile_Display().profiledisplaylist(),
                  builder: (context, snapshots) {

                    return (snapshots.hasData)?

                    ListView.builder(
                      itemCount: snapshots.data?.data?.length??0,
                      itemBuilder: (context,index){
                        var server = snapshots.data!.data![index];
                        var userphoto = server.dbPhoto.toString();
                        var username = server.fullname.toString();
                        var phoneNo = server.usersData![index].contectNo.toString();
                        //print(phoneNo + "AAAAAAAAAAAAAAAAAAAAAAAAAAA");
                        loaddata(userphoto,username,phoneNo);

                        return Column(
                          children: [

                            Container(
                              color: const Color(0xff0e85e5),
                              width: double.infinity,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 50.h,
                                  ),
                                  Text(
                                    'My Profile',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  CircleAvatar(
                                    radius: 50.r,
                                    backgroundImage: NetworkImage(server.dbPhoto.toString()),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    //'Utsav Desai',
                                    server.fullname.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 8.h, left: 10.w),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Theme Style',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18.sp),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 18.w),
                                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                                    height: 43.h,
                                    width: 350.w,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        server.fullname.toString(),
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.r),
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 18.w),
                                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                                    height: 43.h,
                                    width: 350.w,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        //'City',
                                        server.city.toString(),
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.r),
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 18.w),
                                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                                    height: 43.h,
                                    width: 350.w,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        //'+91 9016354954',
                                        server.usersData![index].contectNo.toString(),
                                        textScaleFactor: 1,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.r),
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10.h),
                              child: Column(
                                children: [
                                  InkWell(
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.privacy_tip_sharp,
                                        color: Colors.black,
                                      ),
                                      title: Text(
                                        'Privacy Policy',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                          const PrivacyPolicyScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                  InkWell(
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.menu,
                                        color: Colors.black,
                                      ),
                                      title: Text(
                                        'Terms and Condition',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                          const TermsConditionScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                  InkWell(
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.logout,
                                        color: Colors.black,
                                      ),
                                      title: Text(
                                        'Logout',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    onTap: () async{
                                      final SharedPreferences prefs = await  _prefs;
                                      prefs.remove("ut");
                                      print(prefs.remove("ut").toString()+"==========================>ankit");

                                      await prefs.clear();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              LoginScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      }

                    ):Center(child: CircularProgressIndicator());


                  }
                  ),


            ),

          ),

        ));
  }
}
