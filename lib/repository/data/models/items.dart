class Items {
  int _id;
  String _name;
  String _price;
  String _group;
  String _brand;
  String _category;
  String _uom;
  String _image;

  int get id => _id;
  String get uom => _uom;
  String get category => _category;
  String get brand => _brand;
  String get group => _group;
  String get price => _price;
  String get name => _name;
  String get image => _image;

  Items.fromJson(Map<String, dynamic> json){
    _id = json["id"];
    _name = json["name"];
    _price = json["price"].toString();
    _group = json["group"]["name"];
    _brand = json["brand"]["name"];
    _category = json["category"]["name"];
    _uom = json["uom"]["name"];
    _image = json["image"];
  }
}