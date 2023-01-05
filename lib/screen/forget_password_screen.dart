// import 'package:country_code_picker/country_code.dart';
// import 'package:flutter/material.dart';
//
// import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
// import 'package:flutter_sixvalley_ecommerce/provider/auth_provider.dart';
// import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
// import 'package:flutter_sixvalley_ecommerce/provider/theme_provider.dart';
// import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
// import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
// import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
// import 'package:flutter_sixvalley_ecommerce/view/basewidget/animated_custom_dialog.dart';
// import 'package:flutter_sixvalley_ecommerce/view/basewidget/button/custom_button.dart';
// import 'package:flutter_sixvalley_ecommerce/view/basewidget/my_dialog.dart';
// import 'package:flutter_sixvalley_ecommerce/view/basewidget/textfield/custom_textfield.dart';
// import 'package:flutter_sixvalley_ecommerce/view/screen/auth/widget/code_picker_widget.dart';
// import 'package:flutter_sixvalley_ecommerce/view/screen/auth/widget/otp_verification_screen.dart';
// import 'package:provider/provider.dart';
//
// class ForgetPasswordScreen extends StatefulWidget {
//   @override
//   State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
// }
//
// class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
//   final TextEditingController _controller = TextEditingController();
//   final GlobalKey<ScaffoldMessengerState> _key = GlobalKey();
//   final TextEditingController _numberController = TextEditingController();
//   final FocusNode _numberFocus = FocusNode();
//   String _countryDialCode = '+91';
//
//   @override
//   void initState() {
//     _countryDialCode = CountryCode.fromCountryCode(Provider.of<SplashProvider>(context, listen: false).configModel.countryCode).dialCode;
//     super.initState();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Scaffold(
//       key: _key,
//
//       body: Container(
//         decoration: BoxDecoration(
//           image: Provider.of<ThemeProvider>(context).darkTheme ? null : DecorationImage(image: AssetImage(Images.background), fit: BoxFit.fill),
//         ),
//         child: Column(
//           children: [
//
//             SafeArea(child: Align(
//               alignment: Alignment.centerLeft,
//               child: IconButton(
//                 icon: Icon(Icons.arrow_back_ios_outlined),
//                 onPressed: () => Navigator.pop(context),
//               ),
//             )),
//
//             Expanded(
//               child: ListView(padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL), children: [
//
//                 Padding(
//                   padding: EdgeInsets.all(50),
//                   child: Image.asset(Images.logo_with_name_image, height: 150, width: 200),
//                 ),
//
//                 Text(getTranslated('FORGET_PASSWORD', context), style: titilliumSemiBold),
//
//                 Row(children: [
//                   Expanded(flex: 1, child: Divider(thickness: 1, color: Theme.of(context).primaryColor)),
//                   Expanded(flex: 2, child: Divider(thickness: 0.2, color: Theme.of(context).primaryColor)),
//                 ]),
//
//                 Provider.of<SplashProvider>(context,listen: false).configModel.forgetPasswordVerification == "phone"?
//                 Text(getTranslated('enter_phone_number_for_password_reset', context), style: titilliumRegular.copyWith(color: Theme.of(context).hintColor, fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL)):
//                 Text(getTranslated('enter_email_for_password_reset', context), style: titilliumRegular.copyWith(color: Theme.of(context).hintColor, fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL)),
//                 SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
//
//                 Provider.of<SplashProvider>(context,listen: false).configModel.forgetPasswordVerification == "phone"?
//                 Row(children: [
//                   CodePickerWidget(
//                     onChanged: (CountryCode countryCode) {
//                       _countryDialCode = countryCode.dialCode;
//                       },
//                     initialSelection: _countryDialCode,
//                     favorite: [_countryDialCode],
//                     showDropDownButton: true,
//                     padding: EdgeInsets.zero,
//                     showFlagMain: true,
//                     textStyle: TextStyle(color: Theme.of(context).textTheme.headline1.color),
//
//                   ),
//                   Expanded(child: CustomTextField(
//                     hintText: getTranslated('number_hint', context),
//                     controller: _numberController,
//                     focusNode: _numberFocus,
//                     isPhoneNumber: true,
//                     textInputAction: TextInputAction.done,
//                     textInputType: TextInputType.phone,
//
//                   )),
//                 ])
//                 :
//                 CustomTextField(
//                   controller: _controller,
//                   hintText: getTranslated('ENTER_YOUR_EMAIL', context),
//                   textInputAction: TextInputAction.done,
//                   textInputType: TextInputType.emailAddress,
//                 ),
//                 SizedBox(height: 100),
//
//                 Builder(
//                   builder: (context) => !Provider.of<AuthProvider>(context).isLoading ? CustomButton(
//                     buttonText: Provider.of<SplashProvider>(context,listen: false).configModel.forgetPasswordVerification == "phone"? getTranslated('send_otp', context):getTranslated('send_email', context),
//                     onTap: () {
//                       if(Provider.of<SplashProvider>(context,listen: false).configModel.forgetPasswordVerification == "phone"){
//                         if(_numberController.text.isEmpty) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(content: Text(getTranslated('PHONE_MUST_BE_REQUIRED', context)),backgroundColor: Colors.red,)
//                           );
//
//                         }else{
//                           Provider.of<AuthProvider>(context, listen: false).forgetPassword(_countryDialCode+_numberController.text.trim()).then((value) {
//                             if(value.isSuccess) {
//                               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => VerificationScreen('',_countryDialCode+_numberController.text.trim(),'')), (route) => false);
//                             }else {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(content: Text(getTranslated('input_valid_phone_number', context)),backgroundColor: Colors.red,)
//                               );
//
//                             }
//                           });
//                         }
//
//                       }else{
//                         if(_controller.text.isEmpty) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(content: Text(getTranslated('EMAIL_MUST_BE_REQUIRED', context)),backgroundColor: Colors.red,)
//                           );
//                         }
//                         else {
//
//                           Provider.of<AuthProvider>(context, listen: false).forgetPassword(_controller.text).then((value) {
//
//                             if(value.isSuccess) {
//                               FocusScopeNode currentFocus = FocusScope.of(context);
//                               if (!currentFocus.hasPrimaryFocus) {
//                                 currentFocus.unfocus();
//                               }
//                               _controller.clear();
//
//                               showAnimatedDialog(context, MyDialog(
//                                 icon: Icons.send,
//                                 title: getTranslated('sent', context),
//                                 description: getTranslated('recovery_link_sent', context),
//                                 rotateAngle: 5.5,
//                               ), dismissible: false);
//                             }else {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(content: Text(value.message),backgroundColor: Colors.red,)
//                               );
//                             }
//                           });
//                         }
//                       }
//
//
//                     },
//                   ) : Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor))),
//                 ),
//               ]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
import 'package:delivery_boy/screen/theme_provider.dart';
import 'package:delivery_boy/textfild/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'custom_button.dart';
import 'dimensions.dart';
import 'forgot_password_with_otp.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  TextEditingController _phoneController = TextEditingController();
  FocusNode _phoneFocus = FocusNode();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Provider
          //     .of<ThemeProvider>(context)
          //     .darkTheme
          //     ? SizedBox()
          //     : Image.asset('assets/images/background.jpg',
          //     fit: BoxFit.fill,
          //     height: MediaQuery
          //         .of(context)
          //         .size
          //         .height,
          //     width: MediaQuery
          //         .of(context)
          //         .size
          //         .width),
          Container(
            child: Form(
              key: _formkey,
              child: ListView(
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [

                          Container(
                            height: 250.h,
                            width: 350.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/logo_with_name.png"))),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 2.w),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Color(0xff004351),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "FORGOT PASSWORD?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 1,
                        child: Text(
                          "We will send you an OTP to your registered mobile number",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),

                      Container(
                        margin: EdgeInsets.only(
                            left: Dimensions.MARGIN_SIZE_DEFAULT,
                            right: Dimensions.MARGIN_SIZE_DEFAULT,
                            top: Dimensions.MARGIN_SIZE_SMALL),
                        child: CustomTextField(
                          hintText: 'ENTER_MOBILE_NUMBER',
                          controller: _phoneController,
                          focusNode: _phoneFocus,
                          textInputType: TextInputType.number, fillColor: Colors.white, nextNode: _phoneFocus, textInputAction: TextInputAction.done, maxLine: 1, validatorMessage: '',
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),

                      InkWell(
                        onTap: () {
                          if (!_formkey.currentState!.validate()) {
                            return;
                          } else {
                            continueClick();
                          }
                        },
                        child: Container(
                          height: 35.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3,
                                    offset: Offset(1, 2))
                              ],
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 2.h),
                              child: Text(
                                "Send",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
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
        ],
      ),
    );
  }

  continueClick() async{
    final SharedPreferences prefs =  await _prefs;

    String phone = _phoneController.text.trim();
    print(phone + ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");

    prefs.setString("phone",phone);

    if (phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('PHONE_MUST_BE_REQUIRED'),
        backgroundColor: Colors.red,
      ));
    }
    else{
      FocusScope.of(context).requestFocus(new FocusNode());
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              VerificationScreenn(
                mobile: _phoneController.text.trim(),
                countrycode: "+91",
              ),
        ),
      );
    }
  }
}