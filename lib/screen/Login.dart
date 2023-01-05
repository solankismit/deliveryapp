import 'package:delivery_boy/screen/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Api.dart';
import '../modle/DeleveryBoy_SignIN.dart';
import 'Dashboard.dart';
import 'forget_password_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginScreen extends StatefulWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool value = false;
  bool _isVisible = false;
  bool password = true;
  late TextEditingController _mobileNo;
  late TextEditingController _password;
  late GlobalKey<FormState> _formkey;

  @override
  void initState() {
    super.initState();
 _formkey = GlobalKey<FormState>();
  _mobileNo = TextEditingController();
 _password = TextEditingController();
  }
  @override
  void dispose() {
    _mobileNo.dispose();
    _password.dispose();
    super.dispose();
  }

  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Image.asset(
                  "image/Login.png",
                  fit: BoxFit.cover,
                  height: 250.h,
                  width: 350.w,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 25.sp,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(9.h),
                      child: Align(
                        child: Text("Enter Mobile"),
                        alignment: Alignment.centerLeft,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h),
                      child: TextFormField(
                        controller: _mobileNo,
                        // focusNode: _mobile,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "MobileNo is required ";
                          }
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          // counterText: "",
                          hintText: "9876543210",
                          hintStyle: TextStyle(fontSize: 18.sp),

                          labelText: "Mobile",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r),
                            borderSide: BorderSide(color: Color(0xff0A6A73)),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r)),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff0A6A73)),
                          ),
                        ),
                      ),
                    ),

                    // Container(
                    //   height: 45.h,
                    //   width: 340.w,
                    //   child: Padding(
                    //     padding: EdgeInsets.only(left: 20.w),
                    //     child: TextFormField(
                    //       validator: (value) {
                    //         if (value!.isEmpty) {
                    //           return "Email Id is required ";
                    //         }
                    //         if (value.length < 10) {
                    //           return "Enter valid Email Id.";
                    //         }
                    //       },
                    //       decoration: InputDecoration(
                    //         focusedBorder: InputBorder.none,
                    //         enabledBorder: InputBorder.none,
                    //         hintText: "demo@gmail.com",
                    //       ),
                    //     ),
                    //   ),
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.black26),
                    //     borderRadius: BorderRadius.circular(5.r),
                    //     color: Colors.white,
                    //   ),
                    // ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      margin: EdgeInsets.all(9.h),
                      child: Align(
                        child: Text("Password"),
                        alignment: Alignment.centerLeft,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h),
                      child: TextFormField(
                        obscureText: password,
                        controller: _password,
                        // focusNode: _pass,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password is required";
                          }
                        },
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                password = !password;
                              });
                            },
                            icon: Icon((password != true)
                                ? Icons.remove_red_eye_rounded
                                : Icons.remove_red_eye_outlined),
                          ),
                          hintText: "Password",
                          labelText: "Password",
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff0A6A73)),
                              borderRadius: BorderRadius.circular(15.r)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r)),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff0A6A73)),
                          ),
                        ),
                      ),
                    ),

                    // Container(
                    //   height: 45.h,
                    //   width: 340.w,
                    //   child: Container(
                    //     margin: EdgeInsets.only(top: 4.h, left: 20.w),
                    //     child: TextFormField(
                    //       validator: (value) {
                    //         if (value!.isEmpty) {
                    //           return "Password is required";
                    //         }
                    //       },
                    //       cursorHeight: 15,
                    //       keyboardType: TextInputType.text,
                    //       obscureText: _isVisible ? false : true,
                    //       decoration: InputDecoration(
                    //         focusedBorder: InputBorder.none,
                    //         enabledBorder: InputBorder.none,
                    //         hintText: "**********",
                    //         suffixIcon: IconButton(
                    //           onPressed: () => updateStatus(),
                    //           icon: Icon(
                    //             _isVisible
                    //                 ? Icons.visibility
                    //                 : Icons.visibility_off,
                    //             color: Colors.black12,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.black26),
                    //     borderRadius: BorderRadius.circular(5.r),
                    //     color: Colors.white,
                    //   ),
                    // ),

                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: this.value,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.r)),
                          onChanged: (value) {
                            setState(() {
                              this.value = value as bool;
                            });
                          },
                        ),
                        Text(
                          "Remember Me",
                          style:
                              TextStyle(color: Colors.black, fontSize: 12.sp),
                        ),
                        InkWell(
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (_) => ForgotPassword())),
                          child: Padding(
                            padding:  EdgeInsets.only(left: 120.w),
                            child: Text("ForgotPassword",
                                style:TextStyle(color: Colors.blue)
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 45.h,
                      width: 330.w,
                      child: ElevatedButton(
                          onPressed: () async{

                            final SharedPreferences prefs = await _prefs;

                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();

                              String mobile = _mobileNo.text.trim();
                              String password = _password.text.trim();

                              if (mobile.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content:Text("Enter Mobile"),backgroundColor: Colors.red,),

                                );

                              } else if (password.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text("Password"),backgroundColor: Colors.red,),

                                );
                              } else {


                                Delevery_Sign_In_Model data  =  await  Delevery_SignIn().SignInList(password,mobile);

                                if (data.message != "successfully login") {
                                  print("Please check your Mobile no or password");
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text("Please check your Mobile no or password"),
                                    backgroundColor: Colors.red,
                                  ));
                                } else {
                                  var userToken = data.data!.token.toString();

                                  prefs.setString("ut", userToken);
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(" You Are Successfully Login ..."),
                                    backgroundColor: Colors.green,
                                  ));
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DashboardScreen(),
                                  ));
                                }
                              }
                            }








                            // String mobile = _mobileNo.text.trim();
                            // String password = _password.text.trim();
                            // String role = "deliveryboy";
                            // Delevery_Sign_In_Model data  =  await  Delevery_SignIn().SignInList(password,mobile,role);
                            // var userToken = data.data!.token.toString();
                            // if (!_formkey.currentState!.validate()) {
                            //   return;
                            // }
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (BuildContext context) => DashboardScreen(),
                            //   ),
                            // );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.lightBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
