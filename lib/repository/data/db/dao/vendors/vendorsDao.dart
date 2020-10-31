import 'package:moor_flutter/moor_flutter.dart';
import 'package:stock_management/repository/data/db/db.dart';
import 'package:stock_management/repository/data/db/tables/vendors.dart';

part 'vendorsDao.g.dart';

@UseDao(tables: [Vendors])
class VendorsDao extends DatabaseAccessor<Database> with _$VendorsDaoMixin {
  VendorsDao(Database db) : super(db);

  Future<List<Vendor>> getAllTasks() => select(vendors).get();
}