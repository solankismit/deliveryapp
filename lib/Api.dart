import 'dart:convert';

import 'package:delivery_boy/Base%20Url.dart';
import 'package:delivery_boy/modle/pickuporder_display_model.dart';
import 'package:http/http.dart' as http;

import 'modle/DeleveryBoy_SignIN.dart';
import 'modle/Display_Profile_model.dart';
import 'modle/Forgot_Password_Model.dart';
import 'modle/Order_Display_model.dart';
import 'modle/Order_History_Model.dart';
import 'modle/pickup_order_detils_model.dart';
import 'modle/update_status_model.dart';
import 'modle/view_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';




class Delevery_SignIn{
  Delevery_SignIn();
  Future<Delevery_Sign_In_Model> SignInList(password,mobile) async{
    var url = LURL + "/api/user/loginAll";
    http.Response response = await http.post(Uri.parse(url),
        headers: {"content-type": "application/json"},
    body: json.encode({
    "password": password,
    "mobile": mobile,
    "role": "deliveryboy",
    }));
    var data = json.decode(response.body);
    print("Delevery_SignIn" + response.body);
    return Delevery_Sign_In_Model.fromJson(data);
  }
}

class Order_History {
  Order_History();
  Future<Order_History_Model> OrderHistorylist() async {
     final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
     final SharedPreferences prefs = await _prefs;

    var url = LURL + "/api/order/orderhistory";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization":
        prefs.getString("ut")??"",
        // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyOGUxMDMzMTE5ZDFiNzZkNjJjN2U1NiIsInJvbGUiOiJkZWxpdmVyeWJveSIsImVtYWlsX2FkZHJlc3MiOiJkZWxpdmVyeWJveTFAZ21haWwuY29tIiwiaWF0IjoxNjU3NjAzOTE4LCJleHAiOjE2ODkxMzk5MTh9.N51rTRB1d7-4HIVWwZ8e5xbuqLGaF2i3gfB3paSCb9s"
      },
    );
    var data = json.decode(response.body);
    print("Order_History" + response.body);
    print("00000000000000000 000");

    return Order_History_Model.fromJson(data);
  }
}

class Profile_Display {
  Profile_Display();
  Future<Display_Profile_model> profiledisplaylist() async {
     final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
     final SharedPreferences prefs = await _prefs;

    var url = LURL + "/api/deliveryboy/profiledisplay";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization":
        prefs.getString("ut")??"",
        //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyOGUxMDMzMTE5ZDFiNzZkNjJjN2U1NiIsInJvbGUiOiJkZWxpdmVyeWJveSIsImVtYWlsX2FkZHJlc3MiOiJkZWxpdmVyeWJveTFAZ21haWwuY29tIiwiaWF0IjoxNjYwMTMwNzA3LCJleHAiOjE2OTE2NjY3MDd9.0qj8HOT74K2cSTrMK-nJZR5LOjRUsN3mLI7SRa7iYMY",
        //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyOGUxMDMzMTE5ZDFiNzZkNjJjN2U1NiIsInJvbGUiOiJkZWxpdmVyeWJveSIsImVtYWlsX2FkZHJlc3MiOiJkZWxpdmVyeWJveTFAZ21haWwuY29tIiwiaWF0IjoxNjU3NjAzOTE4LCJleHAiOjE2ODkxMzk5MTh9.N51rTRB1d7-4HIVWwZ8e5xbuqLGaF2i3gfB3paSCb9s"
      },
    );
    var data = json.decode(response.body);
    print("Profile_Display" + response.body);
    print("00000000000000000 000");

    return Display_Profile_model.fromJson(data);
  }
}

class Order_display {
  Order_display();
  Future<Order_Display_model> orderdisplaylist() async {
     final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
     final SharedPreferences prefs = await _prefs;

    var url = LURL + "/api/order/orderlist";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization":
        prefs.getString("ut")??"",
        //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyOGUxMDMzMTE5ZDFiNzZkNjJjN2U1NiIsInJvbGUiOiJkZWxpdmVyeWJveSIsImVtYWlsX2FkZHJlc3MiOiJkZWxpdmVyeWJveTFAZ21haWwuY29tIiwiaWF0IjoxNjUzNTQ2OTU3LCJleHAiOjE2ODUwODI5NTd9.lDSjZoUNBYL16BxxW9NcxK5ERw6BMhD1EWQhWBYBUqc"
      },
    );
    var data = json.decode(response.body);
    print(prefs.getString("ut")??"" + "+++++++++++++++++++++++++++++++++++++++++");
    print("Order_display" + response.body);
    print("00000000000000000 000");

    return Order_Display_model.fromJson(data);
  }
}

class active_order {
  active_order();
  Future<view_details_model> activeorderlist(orderId) async {
     final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
     final SharedPreferences prefs = await _prefs;

    var url = LURL + "/api/order/orderdisplayfordeliveryboy?oid=$orderId";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization":
        prefs.getString("ut")??"",
        //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyOGUxMDMzMTE5ZDFiNzZkNjJjN2U1NiIsInJvbGUiOiJkZWxpdmVyeWJveSIsImVtYWlsX2FkZHJlc3MiOiJkZWxpdmVyeWJveTFAZ21haWwuY29tIiwiaWF0IjoxNjUzNTQ2OTU3LCJleHAiOjE2ODUwODI5NTd9.lDSjZoUNBYL16BxxW9NcxK5ERw6BMhD1EWQhWBYBUqc"
      },
    );
    var data = json.decode(response.body);
    print("active_order" + response.body);
    print("00000000000000000 000");

    return view_details_model.fromJson(data);
  }
}

class pickup_order {
  pickup_order();
  Future<pickuporder_model> pickuporderlist() async {
     final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
     final SharedPreferences prefs = await _prefs;

    var url = LURL + "/api/order/pickuporder?";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization":
        prefs.getString("ut")??"",
      //  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyOGUxMDMzMTE5ZDFiNzZkNjJjN2U1NiIsInJvbGUiOiJkZWxpdmVyeWJveSIsImVtYWlsX2FkZHJlc3MiOiJkZWxpdmVyeWJveTFAZ21haWwuY29tIiwiaWF0IjoxNjUzNTQ2OTU3LCJleHAiOjE2ODUwODI5NTd9.lDSjZoUNBYL16BxxW9NcxK5ERw6BMhD1EWQhWBYBUqc"
      },
    );
    var data = json.decode(response.body);
    print("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyOGUxMDMzMTE5ZDFiNzZkNjJjN2U1NiIsInJvbGUiOiJkZWxpdmVyeWJveSIsImVtYWlsX2FkZHJlc3MiOiJkZWxpdmVyeWJveTFAZ21haWwuY29tIiwiaWF0IjoxNjUzNTQ2OTU3LCJleHAiOjE2ODUwODI5NTd9.lDSjZoUNBYL16BxxW9NcxK5ERw6BMhD1EWQhWBYBUqc");
    print("pickup_order" + response.body);
    print("00000000000000000 000");

    return pickuporder_model.fromJson(data);
  }
}

class Pickup_order_details {
  Pickup_order_details();
  Future<pikup_order_ditails_model> pickup_orderlist(pickupId) async {
     final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
     final SharedPreferences prefs = await _prefs;

    var url = LURL + "/api/order/pickuporderdetail?oid=$pickupId";
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization":
        prefs.getString("ut")??"",
       // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyOGUxMDMzMTE5ZDFiNzZkNjJjN2U1NiIsInJvbGUiOiJkZWxpdmVyeWJveSIsImVtYWlsX2FkZHJlc3MiOiJkZWxpdmVyeWJveTFAZ21haWwuY29tIiwiaWF0IjoxNjUzNTQ2OTU3LCJleHAiOjE2ODUwODI5NTd9.lDSjZoUNBYL16BxxW9NcxK5ERw6BMhD1EWQhWBYBUqc"
      },
    );
    var data = json.decode(response.body);
    print("Pickup_order" + response.body);
    print("00000000000000000 000");

    return pikup_order_ditails_model.fromJson(data);
  }
}

class update_status {
  update_status();
  Future<update_status_model> updatestatus(delivery_status,statusId) async {
     final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
     final SharedPreferences prefs = await _prefs;


  print(statusId.toString());
  print(delivery_status.toString());
    var url = LURL + "/api/order/deliveryboychnagestatus?_id=$statusId";

    http.Response response = await http.put(Uri.parse(url),
        headers: {
          "content-type": "application/json",
          "Authorization":
          prefs.getString("ut")??"",
          //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyOGUxMDMzMTE5ZDFiNzZkNjJjN2U1NiIsInJvbGUiOiJkZWxpdmVyeWJveSIsImVtYWlsX2FkZHJlc3MiOiJkZWxpdmVyeWJveTFAZ21haWwuY29tIiwiaWF0IjoxNjU3Nzk0MzkwLCJleHAiOjE2ODkzMzAzOTB9.Q2il953V6IZ-r1ojzsmQFfWIQ1EZn_sSUY2HUAvcaf8",
        },
        body: json.encode({
          "delivery_status": delivery_status,
        }));
    var data = json.decode(response.body);
    print("update_status" + response.body);
    return update_status_model.fromJson(data);
  }
}


class update_pay_status {
  update_pay_status();
  Future<update_status_model> updatepaystatus(payment_status,payId) async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;


    print(payId.toString());
    print(payment_status.toString());
    var url = LURL + "/api/order/deliveryboychnagestatus?oid=$payId";

    http.Response response = await http.put(Uri.parse(url),
        headers: {
          "content-type": "application/json",
          "Authorization":
          prefs.getString("ut")??"",
          //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyOGUxMDMzMTE5ZDFiNzZkNjJjN2U1NiIsInJvbGUiOiJkZWxpdmVyeWJveSIsImVtYWlsX2FkZHJlc3MiOiJkZWxpdmVyeWJveTFAZ21haWwuY29tIiwiaWF0IjoxNjU3Nzk0MzkwLCJleHAiOjE2ODkzMzAzOTB9.Q2il953V6IZ-r1ojzsmQFfWIQ1EZn_sSUY2HUAvcaf8",
        },
        body: json.encode({
          "payment_status": payment_status,
        }));
    var data = json.decode(response.body);
    print("update_pay_status" + response.body);
    return update_status_model.fromJson(data);
  }
}

class ForgetPassword {
  ForgetPassword();
  Future<ForgotPasswordModel> ForgetPasswordList(
      contect_no, role, new_password) async {
    //final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
   // final SharedPreferences prefs = await _prefs;
    var url = LURL + "/api/user/forgatepassword";
    http.Response response = await http.put(Uri.parse(url),
        headers: {
          "content-type": "application/json",
        },
        body: json.encode({
          "contect_no": contect_no,
          "role": "deliveryboy",
          "new_password": new_password,
        }));
    var data = json.decode(response.body);
    print("FogetPassword Updated "  + response.body);
    return ForgotPasswordModel.fromJson(data);
  }
}