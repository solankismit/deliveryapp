class Order_Display_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  List<Data>? data;

  Order_Display_model(
      {this.code, this.status, this.message, this.metadata, this.data});

  Order_Display_model.fromJson(Map<String, dynamic> json) {
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
  String? orderAddress;
  String? dbAssignedOn;

  Data({this.sId, this.orderAddress, this.dbAssignedOn});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    orderAddress = json['order_address'];
    dbAssignedOn = json['db_assigned_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['order_address'] = this.orderAddress;
    data['db_assigned_on'] = this.dbAssignedOn;
    return data;
  }
}
