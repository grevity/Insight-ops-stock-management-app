import 'package:moor_flutter/moor_flutter.dart';

class ProductsAndVendors extends Table {
  IntColumn get localId => integer().autoIncrement()();
  IntColumn get id => integer()();
  IntColumn get productId => integer()();
  IntColumn get vendorId => integer()();
}