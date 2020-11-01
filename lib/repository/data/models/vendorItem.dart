class VendorItem {
  int _id;
  String _name;
  String _price;
  String _basePrice;
  String _uom;

  int get id => _id;
  String get uom => _uom;
  String get price => _price;
  String get name => _name;
  String get basePrice => _basePrice;

  VendorItem.fromJson(Map<String, dynamic> json){
    _id = json["id"];
    _name = json["item"]["name"];
    _price = json["price"].toString();
    _uom = json["item"]["uom"]["name"];
    _basePrice = json["item"]["price"].toString();
  }
}