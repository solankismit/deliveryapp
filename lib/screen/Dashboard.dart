import 'package:delivery_boy/screen/Home.dart';
import 'package:delivery_boy/screen/OrderHistory.dart';
import 'package:delivery_boy/screen/PickupOrder.dart';
import 'package:delivery_boy/screen/Profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'order_return.dart';


class DashboardScreen extends StatefulWidget {

  //const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedItemIndex = 0;
  int _currentIndex = 0;
  final screen = [
    HomeScreen(),
    PickupOrderScreen(),
    OrderHistoryScreen(),
    ProfileScreen(),
    orderreturn(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: Container(


        margin: EdgeInsets.only(top: 6.h),

        child: Row(

          children: <Widget>[

            buildNavBarItem( Icons.home, 0, "Home",),
            buildNavBarItem(Icons.person, 1, "Pickup Order"),
            buildNavBarItem(Icons.history, 2, "Order History"),
            buildNavBarItem(Icons.person, 3, "Profile"),
            buildNavBarItem(Icons.person, 4, "return order"),
          ],
        ),
      ),
      body: screen[_currentIndex],
    );
  }

  Widget buildNavBarItem(IconData icon, int index, String data, ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
          _currentIndex = index;
        });
      },
      child: Container(
        // margin: EdgeInsets.only(left: 25.w),
        height: 43.h,
        width: MediaQuery.of(context).size.width / 5,
        decoration: index == _selectedItemIndex
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.white),
                ),
              )
            : BoxDecoration(),
        child: Column(
          children: [
            Icon(
              icon,
              color: index == _selectedItemIndex ? Colors.blue : Colors.black26,
              size: 18.h,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(

              data,
              style: TextStyle(
                fontSize: 12,
                color:
                    index == _selectedItemIndex ? Colors.blue : Colors.black26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
