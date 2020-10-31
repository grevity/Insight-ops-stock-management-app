
import 'package:moor_flutter/moor_flutter.dart';

class Products extends Table {
  IntColumn get localId => integer().autoIncrement()();
  IntColumn get id => integer()();
  RealColumn get basePrice => real()();
  TextColumn get phone => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get gstin => text().nullable()();
}