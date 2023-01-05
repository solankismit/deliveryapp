class Order_History_Model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  List<Data>? data;

  Order_History_Model(
      {this.code, this.status, this.message, this.metadata, this.data});

  Order_History_Model.fromJson(Map<String, dynamic> json) {
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
  String? oid;
  int? pprice;
  String? deliveryStatus;
  List<Ordermaster>? ordermaster;

  Data(
      {this.sId, this.oid, this.pprice, this.deliveryStatus, this.ordermaster});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    oid = json['oid'];
    pprice = json['pprice'];
    deliveryStatus = json['delivery_status'];
    if (json['ordermaster'] != null) {
      ordermaster = <Ordermaster>[];
      json['ordermaster'].forEach((v) {
        ordermaster!.add(new Ordermaster.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['oid'] = this.oid;
    data['pprice'] = this.pprice;
    data['delivery_status'] = this.deliveryStatus;
    if (this.ordermaster != null) {
      data['ordermaster'] = this.ordermaster!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ordermaster {
  String? orderDateTime;

  Ordermaster({this.orderDateTime});

  Ordermaster.fromJson(Map<String, dynamic> json) {
    orderDateTime = json['order_date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_date_time'] = this.orderDateTime;
    return data;
  }
}
