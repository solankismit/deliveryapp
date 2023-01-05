import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Profile.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
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
                    'privacy_policy',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
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
