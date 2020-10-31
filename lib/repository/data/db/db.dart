import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:moor/moor.dart';
import 'package:stock_management/repository/data/db/dao/vendors/vendorsDao.dart';
import 'package:stock_management/repository/data/db/tables/products.dart';
import 'dart:io';

import 'package:stock_management/repository/data/db/tables/productsAndVendors.dart';
import 'package:stock_management/repository/data/db/tables/vendors.dart';

part 'db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'insightops_stockdb.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Vendors, Products, ProductsAndVendors], daos: [VendorsDao])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}