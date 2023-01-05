class pikup_order_ditails_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  List<Data>? data;

  pikup_order_ditails_model(
      {this.code, this.status, this.message, this.metadata, this.data});

  pikup_order_ditails_model.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Metadata {
  int? length;

  Metadata({this.length});

  Metadata.fromJson(Map<String, dynamic> json) {
    length = json['length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['length'] = this.length;
    return data;
  }
}

class Data {
  String? sId;
  int? qty;
  String? oid;
  String? pname;
  String? pphoto;
  int? pprice;
  List<Ordermaster>? ordermaster;
  List<Vendor>? vendor;

  Data(
      {this.sId,
        this.qty,
        this.oid,
        this.pname,
        this.pphoto,
        this.pprice,
        this.ordermaster,
        this.vendor});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    qty = json['qty'];
    oid = json['oid'];
    pname = json['pname'];
    pphoto = json['pphoto'];
    pprice = json['pprice'];
    if (json['ordermaster'] != null) {
      ordermaster = <Ordermaster>[];
      json['ordermaster'].forEach((v) {
        ordermaster!.add(new Ordermaster.fromJson(v));
      });
    }
    if (json['vendor'] != null) {
      vendor = <Vendor>[];
      json['vendor'].forEach((v) {
        vendor!.add(new Vendor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['qty'] = this.qty;
    data['oid'] = this.oid;
    data['pname'] = this.pname;
    data['pphoto'] = this.pphoto;
    data['pprice'] = this.pprice;
    if (this.ordermaster != null) {
      data['ordermaster'] = this.ordermaster!.map((v) => v.toJson()).toList();
    }
    if (this.vendor != null) {
      data['vendor'] = this.vendor!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ordermaster {
  int? grandtotal;
  String? orderDateTime;
  String? customerName;
  String? orderAddress;
  List<UserDetail>? userDetail;

  Ordermaster(
      {this.grandtotal,
        this.orderDateTime,
        this.customerName,
        this.orderAddress,
        this.userDetail});

  Ordermaster.fromJson(Map<String, dynamic> json) {
    grandtotal = json['grandtotal'];
    orderDateTime = json['order_date_time'];
    customerName = json['customer_name'];
    orderAddress = json['order_address'];
    if (json['user_detail'] != null) {
      userDetail = <UserDetail>[];
      json['user_detail'].forEach((v) {
        userDetail!.add(new UserDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grandtotal'] = this.grandtotal;
    data['order_date_time'] = this.orderDateTime;
    data['customer_name'] = this.customerName;
    data['order_address'] = this.orderAddress;
    if (this.userDetail != null) {
      data['user_detail'] = this.userDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserDetail {
  String? userPhoto;

  UserDetail({this.userPhoto});

  UserDetail.fromJson(Map<String, dynamic> json) {
    userPhoto = json['user_photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_photo'] = this.userPhoto;
    return data;
  }
}

class Vendor {
  String? emailAddress;
  List<VendorDetail>? vendorDetail;

  Vendor({this.emailAddress, this.vendorDetail});

  Vendor.fromJson(Map<String, dynamic> json) {
    emailAddress = json['email_address'];
    if (json['vendor_detail'] != null) {
      vendorDetail = <VendorDetail>[];
      json['vendor_detail'].forEach((v) {
        vendorDetail!.add(new VendorDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email_address'] = this.emailAddress;
    if (this.vendorDetail != null) {
      data['vendor_detail'] =
          this.vendorDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VendorDetail {
  String? firstName;
  String? lastName;
  String? companyName;
  String? vendorAddress;
  String? vendorContact;
  String? vendorPhoto;

  VendorDetail(
      {this.firstName,
        this.lastName,
        this.companyName,
        this.vendorAddress,
        this.vendorContact,
        this.vendorPhoto});

  VendorDetail.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    companyName = json['company_name'];
    vendorAddress = json['vendor_address'];
    vendorContact = json['vendor_contact'];
    vendorPhoto = json['vendor_photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['company_name'] = this.companyName;
    data['vendor_address'] = this.vendorAddress;
    data['vendor_contact'] = this.vendorContact;
    data['vendor_photo'] = this.vendorPhoto;
    return data;
  }
}
