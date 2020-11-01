import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:stock_management/repository/data/models/items.dart';
import 'package:stock_management/repository/data/models/vendorItem.dart';
import 'package:stock_management/repository/data/models/vendors.dart';
import 'package:stock_management/repository/data/models/warehouse.dart';

final store = ChangeNotifierProvider<StoreViewModel>((ref) {
  return StoreViewModel();
});

class StoreViewModel extends ChangeNotifier {
  List<Vendors> _vendors;
  List<Warehouse> _warehouse;
  List<Items> _items;
  int _selectedVendorId;
  int _selectedWarehouseId;
  List<VendorItem> _vendorItem = [];

  List<Vendors> get vendors => _vendors;
  List<Items> get items => _items;
  int get getSelectedVendorId => _selectedVendorId;
  int get getSelectedWarehouseId => _selectedWarehouseId;
  List<Warehouse> get getWarehouse => _warehouse;
  List<VendorItem> get getVendorItems => _vendorItem;

  setVendors(List<Vendors> vendors){
    _vendors = vendors;
    notifyListeners();
  }

  setItems(List<Items> items) {
    _items = items;
    notifyListeners();
  }

  setSelectedVendor(int id) {
    _selectedVendorId = id;
    notifyListeners();
  }

  setWarehouse(List<Warehouse> warehouse){
    _warehouse = warehouse;
    notifyListeners();
  }

  setSelectedWarehouse(int id){
    _selectedWarehouseId = id;
    notifyListeners();
  }

  setItemVendor(List<VendorItem> itemVendor){
    _vendorItem = itemVendor;
    notifyListeners();
  }

}
