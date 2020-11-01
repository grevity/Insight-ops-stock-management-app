class Warehouse {
  int _id;
  String _name;
  String _type;
  List _address;

  int get id => _id;
  String get name => _name;
  List get address => _address;
  String get type => _type;

  Warehouse.fromJson(Map<String, dynamic> json){
    _id = json["id"];
    _name = json["name"];
    _type = json["type"]["name"];
    _address = json["addressLineOne"];
  }
}