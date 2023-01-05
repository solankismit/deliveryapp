class Display_Profile_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  List<Data>? data;

  Display_Profile_model(
      {this.code, this.status, this.message, this.metadata, this.data});

  Display_Profile_model.fromJson(Map<String, dynamic> json) {
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
  String? fullname;
  String? gender;
  String? dob;
  String? address;
  String? city;
  String? dbProof;
  String? dbPhoto;
  String? status;
  String? adminId;
  String? userId;
  List<UsersData>? usersData;

  Data(
      {this.sId,
        this.fullname,
        this.gender,
        this.dob,
        this.address,
        this.city,
        this.dbProof,
        this.dbPhoto,
        this.status,
        this.adminId,
        this.userId,
        this.usersData});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullname = json['fullname'];
    gender = json['gender'];
    dob = json['dob'];
    address = json['address'];
    city = json['city'];
    dbProof = json['db_proof'];
    dbPhoto = json['db_photo'];
    status = json['status'];
    adminId = json['admin_id'];
    userId = json['user_id'];
    if (json['users_data'] != null) {
      usersData = <UsersData>[];
      json['users_data'].forEach((v) {
        usersData!.add(new UsersData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['fullname'] = this.fullname;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['address'] = this.address;
    data['city'] = this.city;
    data['db_proof'] = this.dbProof;
    data['db_photo'] = this.dbPhoto;
    data['status'] = this.status;
    data['admin_id'] = this.adminId;
    data['user_id'] = this.userId;
    if (this.usersData != null) {
      data['users_data'] = this.usersData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UsersData {
  int? contectNo;

  UsersData({this.contectNo});

  UsersData.fromJson(Map<String, dynamic> json) {
    contectNo = json['contect_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contect_no'] = this.contectNo;
    return data;
  }
}
