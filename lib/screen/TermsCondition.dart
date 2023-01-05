import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Profile.dart';

class TermsConditionScreen extends StatefulWidget {
  const TermsConditionScreen({Key? key}) : super(key: key);

  @override
  State<TermsConditionScreen> createState() => _TermsConditionScreenState();
}

class _TermsConditionScreenState extends State<TermsConditionScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(8),
              child: Row(
                children: [
                  IconButton(
                    icon : Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    onPressed: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ProfileScreen()));
                    },
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  Text(
                    'Terms and Condition',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
