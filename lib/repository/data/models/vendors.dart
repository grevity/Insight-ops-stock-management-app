class Vendors {
  int _id;
  String _fullname;
  String _email;
  String _phone;
  String _gstin;

  int get id => _id;
  String get fullname => _fullname;
  String get email => _email;
  String get phone => _phone;
  String get gstin => _gstin;

  Vendors.fromJson(Map<String, dynamic> json) {
    _id = json["id"];
    _fullname = json["fullname"];
    _email = json["email"];
    _phone = json["phone"];
    _gstin = json["gstin"];
  }
}