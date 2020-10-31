
import 'package:moor_flutter/moor_flutter.dart';

class Vendors extends Table {
  IntColumn get localId => integer().autoIncrement()();
  IntColumn get id => integer()();
  TextColumn get fullname => text()();
  TextColumn get phone => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get gstin => text().nullable()();
}