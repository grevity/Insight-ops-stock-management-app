// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Vendor extends DataClass implements Insertable<Vendor> {
  final int localId;
  final int id;
  final String fullname;
  final String phone;
  final String email;
  final String gstin;
  Vendor(
      {@required this.localId,
      @required this.id,
      @required this.fullname,
      this.phone,
      this.email,
      this.gstin});
  factory Vendor.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Vendor(
      localId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}local_id']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      fullname: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}fullname']),
      phone:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}phone']),
      email:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
      gstin:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}gstin']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || localId != null) {
      map['local_id'] = Variable<int>(localId);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || fullname != null) {
      map['fullname'] = Variable<String>(fullname);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || gstin != null) {
      map['gstin'] = Variable<String>(gstin);
    }
    return map;
  }

  VendorsCompanion toCompanion(bool nullToAbsent) {
    return VendorsCompanion(
      localId: localId == null && nullToAbsent
          ? const Value.absent()
          : Value(localId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      fullname: fullname == null && nullToAbsent
          ? const Value.absent()
          : Value(fullname),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      gstin:
          gstin == null && nullToAbsent ? const Value.absent() : Value(gstin),
    );
  }

  factory Vendor.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Vendor(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<int>(json['id']),
      fullname: serializer.fromJson<String>(json['fullname']),
      phone: serializer.fromJson<String>(json['phone']),
      email: serializer.fromJson<String>(json['email']),
      gstin: serializer.fromJson<String>(json['gstin']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<int>(id),
      'fullname': serializer.toJson<String>(fullname),
      'phone': serializer.toJson<String>(phone),
      'email': serializer.toJson<String>(email),
      'gstin': serializer.toJson<String>(gstin),
    };
  }

  Vendor copyWith(
          {int localId,
          int id,
          String fullname,
          String phone,
          String email,
          String gstin}) =>
      Vendor(
        localId: localId ?? this.localId,
        id: id ?? this.id,
        fullname: fullname ?? this.fullname,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        gstin: gstin ?? this.gstin,
      );
  @override
  String toString() {
    return (StringBuffer('Vendor(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('fullname: $fullname, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('gstin: $gstin')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      localId.hashCode,
      $mrjc(
          id.hashCode,
          $mrjc(fullname.hashCode,
              $mrjc(phone.hashCode, $mrjc(email.hashCode, gstin.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Vendor &&
          other.localId == this.localId &&
          other.id == this.id &&
          other.fullname == this.fullname &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.gstin == this.gstin);
}

class VendorsCompanion extends UpdateCompanion<Vendor> {
  final Value<int> localId;
  final Value<int> id;
  final Value<String> fullname;
  final Value<String> phone;
  final Value<String> email;
  final Value<String> gstin;
  const VendorsCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.fullname = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.gstin = const Value.absent(),
  });
  VendorsCompanion.insert({
    this.localId = const Value.absent(),
    @required int id,
    @required String fullname,
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.gstin = const Value.absent(),
  })  : id = Value(id),
        fullname = Value(fullname);
  static Insertable<Vendor> custom({
    Expression<int> localId,
    Expression<int> id,
    Expression<String> fullname,
    Expression<String> phone,
    Expression<String> email,
    Expression<String> gstin,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (id != null) 'id': id,
      if (fullname != null) 'fullname': fullname,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (gstin != null) 'gstin': gstin,
    });
  }

  VendorsCompanion copyWith(
      {Value<int> localId,
      Value<int> id,
      Value<String> fullname,
      Value<String> phone,
      Value<String> email,
      Value<String> gstin}) {
    return VendorsCompanion(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      fullname: fullname ?? this.fullname,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      gstin: gstin ?? this.gstin,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fullname.present) {
      map['fullname'] = Variable<String>(fullname.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (gstin.present) {
      map['gstin'] = Variable<String>(gstin.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VendorsCompanion(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('fullname: $fullname, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('gstin: $gstin')
          ..write(')'))
        .toString();
  }
}

class $VendorsTable extends Vendors with TableInfo<$VendorsTable, Vendor> {
  final GeneratedDatabase _db;
  final String _alias;
  $VendorsTable(this._db, [this._alias]);
  final VerificationMeta _localIdMeta = const VerificationMeta('localId');
  GeneratedIntColumn _localId;
  @override
  GeneratedIntColumn get localId => _localId ??= _constructLocalId();
  GeneratedIntColumn _constructLocalId() {
    return GeneratedIntColumn('local_id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _fullnameMeta = const VerificationMeta('fullname');
  GeneratedTextColumn _fullname;
  @override
  GeneratedTextColumn get fullname => _fullname ??= _constructFullname();
  GeneratedTextColumn _constructFullname() {
    return GeneratedTextColumn(
      'fullname',
      $tableName,
      false,
    );
  }

  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  GeneratedTextColumn _phone;
  @override
  GeneratedTextColumn get phone => _phone ??= _constructPhone();
  GeneratedTextColumn _constructPhone() {
    return GeneratedTextColumn(
      'phone',
      $tableName,
      true,
    );
  }

  final VerificationMeta _emailMeta = const VerificationMeta('email');
  GeneratedTextColumn _email;
  @override
  GeneratedTextColumn get email => _email ??= _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn(
      'email',
      $tableName,
      true,
    );
  }

  final VerificationMeta _gstinMeta = const VerificationMeta('gstin');
  GeneratedTextColumn _gstin;
  @override
  GeneratedTextColumn get gstin => _gstin ??= _constructGstin();
  GeneratedTextColumn _constructGstin() {
    return GeneratedTextColumn(
      'gstin',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [localId, id, fullname, phone, email, gstin];
  @override
  $VendorsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'vendors';
  @override
  final String actualTableName = 'vendors';
  @override
  VerificationContext validateIntegrity(Insertable<Vendor> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(_localIdMeta,
          localId.isAcceptableOrUnknown(data['local_id'], _localIdMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('fullname')) {
      context.handle(_fullnameMeta,
          fullname.isAcceptableOrUnknown(data['fullname'], _fullnameMeta));
    } else if (isInserting) {
      context.missing(_fullnameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone'], _phoneMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email'], _emailMeta));
    }
    if (data.containsKey('gstin')) {
      context.handle(
          _gstinMeta, gstin.isAcceptableOrUnknown(data['gstin'], _gstinMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  Vendor map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Vendor.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $VendorsTable createAlias(String alias) {
    return $VendorsTable(_db, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final int localId;
  final int id;
  final double basePrice;
  final String phone;
  final String email;
  final String gstin;
  Product(
      {@required this.localId,
      @required this.id,
      @required this.basePrice,
      this.phone,
      this.email,
      this.gstin});
  factory Product.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    final stringType = db.typeSystem.forDartType<String>();
    return Product(
      localId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}local_id']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      basePrice: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}base_price']),
      phone:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}phone']),
      email:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
      gstin:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}gstin']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || localId != null) {
      map['local_id'] = Variable<int>(localId);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || basePrice != null) {
      map['base_price'] = Variable<double>(basePrice);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || gstin != null) {
      map['gstin'] = Variable<String>(gstin);
    }
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      localId: localId == null && nullToAbsent
          ? const Value.absent()
          : Value(localId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      basePrice: basePrice == null && nullToAbsent
          ? const Value.absent()
          : Value(basePrice),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      gstin:
          gstin == null && nullToAbsent ? const Value.absent() : Value(gstin),
    );
  }

  factory Product.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Product(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<int>(json['id']),
      basePrice: serializer.fromJson<double>(json['basePrice']),
      phone: serializer.fromJson<String>(json['phone']),
      email: serializer.fromJson<String>(json['email']),
      gstin: serializer.fromJson<String>(json['gstin']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<int>(id),
      'basePrice': serializer.toJson<double>(basePrice),
      'phone': serializer.toJson<String>(phone),
      'email': serializer.toJson<String>(email),
      'gstin': serializer.toJson<String>(gstin),
    };
  }

  Product copyWith(
          {int localId,
          int id,
          double basePrice,
          String phone,
          String email,
          String gstin}) =>
      Product(
        localId: localId ?? this.localId,
        id: id ?? this.id,
        basePrice: basePrice ?? this.basePrice,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        gstin: gstin ?? this.gstin,
      );
  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('basePrice: $basePrice, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('gstin: $gstin')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      localId.hashCode,
      $mrjc(
          id.hashCode,
          $mrjc(basePrice.hashCode,
              $mrjc(phone.hashCode, $mrjc(email.hashCode, gstin.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Product &&
          other.localId == this.localId &&
          other.id == this.id &&
          other.basePrice == this.basePrice &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.gstin == this.gstin);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<int> localId;
  final Value<int> id;
  final Value<double> basePrice;
  final Value<String> phone;
  final Value<String> email;
  final Value<String> gstin;
  const ProductsCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.basePrice = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.gstin = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.localId = const Value.absent(),
    @required int id,
    @required double basePrice,
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.gstin = const Value.absent(),
  })  : id = Value(id),
        basePrice = Value(basePrice);
  static Insertable<Product> custom({
    Expression<int> localId,
    Expression<int> id,
    Expression<double> basePrice,
    Expression<String> phone,
    Expression<String> email,
    Expression<String> gstin,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (id != null) 'id': id,
      if (basePrice != null) 'base_price': basePrice,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (gstin != null) 'gstin': gstin,
    });
  }

  ProductsCompanion copyWith(
      {Value<int> localId,
      Value<int> id,
      Value<double> basePrice,
      Value<String> phone,
      Value<String> email,
      Value<String> gstin}) {
    return ProductsCompanion(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      basePrice: basePrice ?? this.basePrice,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      gstin: gstin ?? this.gstin,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (basePrice.present) {
      map['base_price'] = Variable<double>(basePrice.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (gstin.present) {
      map['gstin'] = Variable<String>(gstin.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('basePrice: $basePrice, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('gstin: $gstin')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  final GeneratedDatabase _db;
  final String _alias;
  $ProductsTable(this._db, [this._alias]);
  final VerificationMeta _localIdMeta = const VerificationMeta('localId');
  GeneratedIntColumn _localId;
  @override
  GeneratedIntColumn get localId => _localId ??= _constructLocalId();
  GeneratedIntColumn _constructLocalId() {
    return GeneratedIntColumn('local_id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _basePriceMeta = const VerificationMeta('basePrice');
  GeneratedRealColumn _basePrice;
  @override
  GeneratedRealColumn get basePrice => _basePrice ??= _constructBasePrice();
  GeneratedRealColumn _constructBasePrice() {
    return GeneratedRealColumn(
      'base_price',
      $tableName,
      false,
    );
  }

  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  GeneratedTextColumn _phone;
  @override
  GeneratedTextColumn get phone => _phone ??= _constructPhone();
  GeneratedTextColumn _constructPhone() {
    return GeneratedTextColumn(
      'phone',
      $tableName,
      true,
    );
  }

  final VerificationMeta _emailMeta = const VerificationMeta('email');
  GeneratedTextColumn _email;
  @override
  GeneratedTextColumn get email => _email ??= _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn(
      'email',
      $tableName,
      true,
    );
  }

  final VerificationMeta _gstinMeta = const VerificationMeta('gstin');
  GeneratedTextColumn _gstin;
  @override
  GeneratedTextColumn get gstin => _gstin ??= _constructGstin();
  GeneratedTextColumn _constructGstin() {
    return GeneratedTextColumn(
      'gstin',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [localId, id, basePrice, phone, email, gstin];
  @override
  $ProductsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'products';
  @override
  final String actualTableName = 'products';
  @override
  VerificationContext validateIntegrity(Insertable<Product> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(_localIdMeta,
          localId.isAcceptableOrUnknown(data['local_id'], _localIdMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('base_price')) {
      context.handle(_basePriceMeta,
          basePrice.isAcceptableOrUnknown(data['base_price'], _basePriceMeta));
    } else if (isInserting) {
      context.missing(_basePriceMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone'], _phoneMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email'], _emailMeta));
    }
    if (data.containsKey('gstin')) {
      context.handle(
          _gstinMeta, gstin.isAcceptableOrUnknown(data['gstin'], _gstinMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  Product map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Product.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(_db, alias);
  }
}

class ProductsAndVendor extends DataClass
    implements Insertable<ProductsAndVendor> {
  final int localId;
  final int id;
  final int productId;
  final int vendorId;
  ProductsAndVendor(
      {@required this.localId,
      @required this.id,
      @required this.productId,
      @required this.vendorId});
  factory ProductsAndVendor.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return ProductsAndVendor(
      localId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}local_id']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      productId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}product_id']),
      vendorId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}vendor_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || localId != null) {
      map['local_id'] = Variable<int>(localId);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || productId != null) {
      map['product_id'] = Variable<int>(productId);
    }
    if (!nullToAbsent || vendorId != null) {
      map['vendor_id'] = Variable<int>(vendorId);
    }
    return map;
  }

  ProductsAndVendorsCompanion toCompanion(bool nullToAbsent) {
    return ProductsAndVendorsCompanion(
      localId: localId == null && nullToAbsent
          ? const Value.absent()
          : Value(localId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      productId: productId == null && nullToAbsent
          ? const Value.absent()
          : Value(productId),
      vendorId: vendorId == null && nullToAbsent
          ? const Value.absent()
          : Value(vendorId),
    );
  }

  factory ProductsAndVendor.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ProductsAndVendor(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<int>(json['productId']),
      vendorId: serializer.fromJson<int>(json['vendorId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<int>(productId),
      'vendorId': serializer.toJson<int>(vendorId),
    };
  }

  ProductsAndVendor copyWith(
          {int localId, int id, int productId, int vendorId}) =>
      ProductsAndVendor(
        localId: localId ?? this.localId,
        id: id ?? this.id,
        productId: productId ?? this.productId,
        vendorId: vendorId ?? this.vendorId,
      );
  @override
  String toString() {
    return (StringBuffer('ProductsAndVendor(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('vendorId: $vendorId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(localId.hashCode,
      $mrjc(id.hashCode, $mrjc(productId.hashCode, vendorId.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ProductsAndVendor &&
          other.localId == this.localId &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.vendorId == this.vendorId);
}

class ProductsAndVendorsCompanion extends UpdateCompanion<ProductsAndVendor> {
  final Value<int> localId;
  final Value<int> id;
  final Value<int> productId;
  final Value<int> vendorId;
  const ProductsAndVendorsCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.vendorId = const Value.absent(),
  });
  ProductsAndVendorsCompanion.insert({
    this.localId = const Value.absent(),
    @required int id,
    @required int productId,
    @required int vendorId,
  })  : id = Value(id),
        productId = Value(productId),
        vendorId = Value(vendorId);
  static Insertable<ProductsAndVendor> custom({
    Expression<int> localId,
    Expression<int> id,
    Expression<int> productId,
    Expression<int> vendorId,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (vendorId != null) 'vendor_id': vendorId,
    });
  }

  ProductsAndVendorsCompanion copyWith(
      {Value<int> localId,
      Value<int> id,
      Value<int> productId,
      Value<int> vendorId}) {
    return ProductsAndVendorsCompanion(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      productId: productId ?? this.productId,
      vendorId: vendorId ?? this.vendorId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (vendorId.present) {
      map['vendor_id'] = Variable<int>(vendorId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsAndVendorsCompanion(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('vendorId: $vendorId')
          ..write(')'))
        .toString();
  }
}

class $ProductsAndVendorsTable extends ProductsAndVendors
    with TableInfo<$ProductsAndVendorsTable, ProductsAndVendor> {
  final GeneratedDatabase _db;
  final String _alias;
  $ProductsAndVendorsTable(this._db, [this._alias]);
  final VerificationMeta _localIdMeta = const VerificationMeta('localId');
  GeneratedIntColumn _localId;
  @override
  GeneratedIntColumn get localId => _localId ??= _constructLocalId();
  GeneratedIntColumn _constructLocalId() {
    return GeneratedIntColumn('local_id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _productIdMeta = const VerificationMeta('productId');
  GeneratedIntColumn _productId;
  @override
  GeneratedIntColumn get productId => _productId ??= _constructProductId();
  GeneratedIntColumn _constructProductId() {
    return GeneratedIntColumn(
      'product_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _vendorIdMeta = const VerificationMeta('vendorId');
  GeneratedIntColumn _vendorId;
  @override
  GeneratedIntColumn get vendorId => _vendorId ??= _constructVendorId();
  GeneratedIntColumn _constructVendorId() {
    return GeneratedIntColumn(
      'vendor_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [localId, id, productId, vendorId];
  @override
  $ProductsAndVendorsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'products_and_vendors';
  @override
  final String actualTableName = 'products_and_vendors';
  @override
  VerificationContext validateIntegrity(Insertable<ProductsAndVendor> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(_localIdMeta,
          localId.isAcceptableOrUnknown(data['local_id'], _localIdMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id'], _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('vendor_id')) {
      context.handle(_vendorIdMeta,
          vendorId.isAcceptableOrUnknown(data['vendor_id'], _vendorIdMeta));
    } else if (isInserting) {
      context.missing(_vendorIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  ProductsAndVendor map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ProductsAndVendor.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ProductsAndVendorsTable createAlias(String alias) {
    return $ProductsAndVendorsTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $VendorsTable _vendors;
  $VendorsTable get vendors => _vendors ??= $VendorsTable(this);
  $ProductsTable _products;
  $ProductsTable get products => _products ??= $ProductsTable(this);
  $ProductsAndVendorsTable _productsAndVendors;
  $ProductsAndVendorsTable get productsAndVendors =>
      _productsAndVendors ??= $ProductsAndVendorsTable(this);
  VendorsDao _vendorsDao;
  VendorsDao get vendorsDao => _vendorsDao ??= VendorsDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [vendors, products, productsAndVendors];
}
