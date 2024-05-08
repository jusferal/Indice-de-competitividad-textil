import 'package:flutter/material.dart';

class UserData extends ChangeNotifier {
  String? _id;
  String? _name;
  String? _numDocument;
  String? _cellphone;
  String? _email;
  String? _region;
  String? _province;
  String? _district;
  String? _address;

  get id => _id;
  get name => _name;
  get numDocument => _numDocument;
  get cellphone => _cellphone;
  get email => _email;
  get region => _region;
  get province => _province;
  get district => _district;
  get address => _address;
  void setUser(String id, String name, String numDocument, String cellphone,
      String email, String region, String province, String district, address) {
    _id = id;
    _name = name;
    _numDocument = numDocument;
    _cellphone = cellphone;
    _email = email;
    _region = region;
    _province = province;
    _district = district;
    _address = address;
    notifyListeners();
  }
  /*UserData({
    required this.id,
    required this.name,
    required this.cellphone,
    required this.email,
    required this.region,
    required this.province,
    required this.district,
    required this.address,
  });*/
}
