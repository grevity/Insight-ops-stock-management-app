import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:stock_management/repository/data/models/items.dart';
import 'package:stock_management/repository/data/models/vendors.dart';

final store = ChangeNotifierProvider<StoreViewModel>((ref) {
  return StoreViewModel();
});

class StoreViewModel extends ChangeNotifier {
  List<Vendors> _vendors;
  List<Items> _items;

  List<Vendors> get vendors => _vendors;
  List<Items> get items => _items;

  setVendors(List<Vendors> vendors){
    _vendors = vendors;
    notifyListeners();
  }

  setItems(List<Items> items) {
    _items = items;
    notifyListeners();
  }
}
