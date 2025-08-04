// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dbHelper.dart';

// ignore_for_file: type=lint
class $StockTable extends Stock with TableInfo<$StockTable, StockData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StockTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _stokMeta = const VerificationMeta('stok');
  @override
  late final GeneratedColumn<int> stok = GeneratedColumn<int>(
      'stok', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, stok];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stock';
  @override
  VerificationContext validateIntegrity(Insertable<StockData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('stok')) {
      context.handle(
          _stokMeta, stok.isAcceptableOrUnknown(data['stok']!, _stokMeta));
    } else if (isInserting) {
      context.missing(_stokMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StockData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StockData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      stok: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}stok'])!,
    );
  }

  @override
  $StockTable createAlias(String alias) {
    return $StockTable(attachedDatabase, alias);
  }
}

class StockData extends DataClass implements Insertable<StockData> {
  final String id;
  final String name;
  final int stok;
  const StockData({required this.id, required this.name, required this.stok});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['stok'] = Variable<int>(stok);
    return map;
  }

  StockCompanion toCompanion(bool nullToAbsent) {
    return StockCompanion(
      id: Value(id),
      name: Value(name),
      stok: Value(stok),
    );
  }

  factory StockData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StockData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      stok: serializer.fromJson<int>(json['stok']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'stok': serializer.toJson<int>(stok),
    };
  }

  StockData copyWith({String? id, String? name, int? stok}) => StockData(
        id: id ?? this.id,
        name: name ?? this.name,
        stok: stok ?? this.stok,
      );
  StockData copyWithCompanion(StockCompanion data) {
    return StockData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      stok: data.stok.present ? data.stok.value : this.stok,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StockData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('stok: $stok')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, stok);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StockData &&
          other.id == this.id &&
          other.name == this.name &&
          other.stok == this.stok);
}

class StockCompanion extends UpdateCompanion<StockData> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> stok;
  final Value<int> rowid;
  const StockCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.stok = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StockCompanion.insert({
    required String id,
    required String name,
    required int stok,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        stok = Value(stok);
  static Insertable<StockData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? stok,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (stok != null) 'stok': stok,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StockCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<int>? stok,
      Value<int>? rowid}) {
    return StockCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      stok: stok ?? this.stok,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (stok.present) {
      map['stok'] = Variable<int>(stok.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StockCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('stok: $stok, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StockinTable extends Stockin with TableInfo<$StockinTable, StockinData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StockinTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _stockIdMeta =
      const VerificationMeta('stockId');
  @override
  late final GeneratedColumn<String> stockId = GeneratedColumn<String>(
      'stock_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES stock(id)');
  static const VerificationMeta _stockMeta = const VerificationMeta('stock');
  @override
  late final GeneratedColumn<int> stock = GeneratedColumn<int>(
      'stock', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, stockId, stock, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stockin';
  @override
  VerificationContext validateIntegrity(Insertable<StockinData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('stock_id')) {
      context.handle(_stockIdMeta,
          stockId.isAcceptableOrUnknown(data['stock_id']!, _stockIdMeta));
    }
    if (data.containsKey('stock')) {
      context.handle(
          _stockMeta, stock.isAcceptableOrUnknown(data['stock']!, _stockMeta));
    } else if (isInserting) {
      context.missing(_stockMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StockinData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StockinData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      stockId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}stock_id']),
      stock: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}stock'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date']),
    );
  }

  @override
  $StockinTable createAlias(String alias) {
    return $StockinTable(attachedDatabase, alias);
  }
}

class StockinData extends DataClass implements Insertable<StockinData> {
  final String id;
  final String? stockId;
  final int stock;
  final DateTime? date;
  const StockinData(
      {required this.id, this.stockId, required this.stock, this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || stockId != null) {
      map['stock_id'] = Variable<String>(stockId);
    }
    map['stock'] = Variable<int>(stock);
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    return map;
  }

  StockinCompanion toCompanion(bool nullToAbsent) {
    return StockinCompanion(
      id: Value(id),
      stockId: stockId == null && nullToAbsent
          ? const Value.absent()
          : Value(stockId),
      stock: Value(stock),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    );
  }

  factory StockinData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StockinData(
      id: serializer.fromJson<String>(json['id']),
      stockId: serializer.fromJson<String?>(json['stockId']),
      stock: serializer.fromJson<int>(json['stock']),
      date: serializer.fromJson<DateTime?>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'stockId': serializer.toJson<String?>(stockId),
      'stock': serializer.toJson<int>(stock),
      'date': serializer.toJson<DateTime?>(date),
    };
  }

  StockinData copyWith(
          {String? id,
          Value<String?> stockId = const Value.absent(),
          int? stock,
          Value<DateTime?> date = const Value.absent()}) =>
      StockinData(
        id: id ?? this.id,
        stockId: stockId.present ? stockId.value : this.stockId,
        stock: stock ?? this.stock,
        date: date.present ? date.value : this.date,
      );
  StockinData copyWithCompanion(StockinCompanion data) {
    return StockinData(
      id: data.id.present ? data.id.value : this.id,
      stockId: data.stockId.present ? data.stockId.value : this.stockId,
      stock: data.stock.present ? data.stock.value : this.stock,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StockinData(')
          ..write('id: $id, ')
          ..write('stockId: $stockId, ')
          ..write('stock: $stock, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, stockId, stock, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StockinData &&
          other.id == this.id &&
          other.stockId == this.stockId &&
          other.stock == this.stock &&
          other.date == this.date);
}

class StockinCompanion extends UpdateCompanion<StockinData> {
  final Value<String> id;
  final Value<String?> stockId;
  final Value<int> stock;
  final Value<DateTime?> date;
  final Value<int> rowid;
  const StockinCompanion({
    this.id = const Value.absent(),
    this.stockId = const Value.absent(),
    this.stock = const Value.absent(),
    this.date = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StockinCompanion.insert({
    required String id,
    this.stockId = const Value.absent(),
    required int stock,
    this.date = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        stock = Value(stock);
  static Insertable<StockinData> custom({
    Expression<String>? id,
    Expression<String>? stockId,
    Expression<int>? stock,
    Expression<DateTime>? date,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (stockId != null) 'stock_id': stockId,
      if (stock != null) 'stock': stock,
      if (date != null) 'date': date,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StockinCompanion copyWith(
      {Value<String>? id,
      Value<String?>? stockId,
      Value<int>? stock,
      Value<DateTime?>? date,
      Value<int>? rowid}) {
    return StockinCompanion(
      id: id ?? this.id,
      stockId: stockId ?? this.stockId,
      stock: stock ?? this.stock,
      date: date ?? this.date,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (stockId.present) {
      map['stock_id'] = Variable<String>(stockId.value);
    }
    if (stock.present) {
      map['stock'] = Variable<int>(stock.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StockinCompanion(')
          ..write('id: $id, ')
          ..write('stockId: $stockId, ')
          ..write('stock: $stock, ')
          ..write('date: $date, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StockoutTable extends Stockout
    with TableInfo<$StockoutTable, StockoutData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StockoutTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _stockIdMeta =
      const VerificationMeta('stockId');
  @override
  late final GeneratedColumn<String> stockId = GeneratedColumn<String>(
      'stock_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES stock(id)');
  static const VerificationMeta _stockMeta = const VerificationMeta('stock');
  @override
  late final GeneratedColumn<int> stock = GeneratedColumn<int>(
      'stock', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, stockId, stock, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stockout';
  @override
  VerificationContext validateIntegrity(Insertable<StockoutData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('stock_id')) {
      context.handle(_stockIdMeta,
          stockId.isAcceptableOrUnknown(data['stock_id']!, _stockIdMeta));
    }
    if (data.containsKey('stock')) {
      context.handle(
          _stockMeta, stock.isAcceptableOrUnknown(data['stock']!, _stockMeta));
    } else if (isInserting) {
      context.missing(_stockMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StockoutData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StockoutData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      stockId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}stock_id']),
      stock: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}stock'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date']),
    );
  }

  @override
  $StockoutTable createAlias(String alias) {
    return $StockoutTable(attachedDatabase, alias);
  }
}

class StockoutData extends DataClass implements Insertable<StockoutData> {
  final String id;
  final String? stockId;
  final int stock;
  final DateTime? date;
  const StockoutData(
      {required this.id, this.stockId, required this.stock, this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || stockId != null) {
      map['stock_id'] = Variable<String>(stockId);
    }
    map['stock'] = Variable<int>(stock);
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    return map;
  }

  StockoutCompanion toCompanion(bool nullToAbsent) {
    return StockoutCompanion(
      id: Value(id),
      stockId: stockId == null && nullToAbsent
          ? const Value.absent()
          : Value(stockId),
      stock: Value(stock),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    );
  }

  factory StockoutData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StockoutData(
      id: serializer.fromJson<String>(json['id']),
      stockId: serializer.fromJson<String?>(json['stockId']),
      stock: serializer.fromJson<int>(json['stock']),
      date: serializer.fromJson<DateTime?>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'stockId': serializer.toJson<String?>(stockId),
      'stock': serializer.toJson<int>(stock),
      'date': serializer.toJson<DateTime?>(date),
    };
  }

  StockoutData copyWith(
          {String? id,
          Value<String?> stockId = const Value.absent(),
          int? stock,
          Value<DateTime?> date = const Value.absent()}) =>
      StockoutData(
        id: id ?? this.id,
        stockId: stockId.present ? stockId.value : this.stockId,
        stock: stock ?? this.stock,
        date: date.present ? date.value : this.date,
      );
  StockoutData copyWithCompanion(StockoutCompanion data) {
    return StockoutData(
      id: data.id.present ? data.id.value : this.id,
      stockId: data.stockId.present ? data.stockId.value : this.stockId,
      stock: data.stock.present ? data.stock.value : this.stock,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StockoutData(')
          ..write('id: $id, ')
          ..write('stockId: $stockId, ')
          ..write('stock: $stock, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, stockId, stock, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StockoutData &&
          other.id == this.id &&
          other.stockId == this.stockId &&
          other.stock == this.stock &&
          other.date == this.date);
}

class StockoutCompanion extends UpdateCompanion<StockoutData> {
  final Value<String> id;
  final Value<String?> stockId;
  final Value<int> stock;
  final Value<DateTime?> date;
  final Value<int> rowid;
  const StockoutCompanion({
    this.id = const Value.absent(),
    this.stockId = const Value.absent(),
    this.stock = const Value.absent(),
    this.date = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StockoutCompanion.insert({
    required String id,
    this.stockId = const Value.absent(),
    required int stock,
    this.date = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        stock = Value(stock);
  static Insertable<StockoutData> custom({
    Expression<String>? id,
    Expression<String>? stockId,
    Expression<int>? stock,
    Expression<DateTime>? date,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (stockId != null) 'stock_id': stockId,
      if (stock != null) 'stock': stock,
      if (date != null) 'date': date,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StockoutCompanion copyWith(
      {Value<String>? id,
      Value<String?>? stockId,
      Value<int>? stock,
      Value<DateTime?>? date,
      Value<int>? rowid}) {
    return StockoutCompanion(
      id: id ?? this.id,
      stockId: stockId ?? this.stockId,
      stock: stock ?? this.stock,
      date: date ?? this.date,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (stockId.present) {
      map['stock_id'] = Variable<String>(stockId.value);
    }
    if (stock.present) {
      map['stock'] = Variable<int>(stock.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StockoutCompanion(')
          ..write('id: $id, ')
          ..write('stockId: $stockId, ')
          ..write('stock: $stock, ')
          ..write('date: $date, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$Dbhelper extends GeneratedDatabase {
  _$Dbhelper(QueryExecutor e) : super(e);
  $DbhelperManager get managers => $DbhelperManager(this);
  late final $StockTable stock = $StockTable(this);
  late final $StockinTable stockin = $StockinTable(this);
  late final $StockoutTable stockout = $StockoutTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [stock, stockin, stockout];
}

typedef $$StockTableCreateCompanionBuilder = StockCompanion Function({
  required String id,
  required String name,
  required int stok,
  Value<int> rowid,
});
typedef $$StockTableUpdateCompanionBuilder = StockCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<int> stok,
  Value<int> rowid,
});

final class $$StockTableReferences
    extends BaseReferences<_$Dbhelper, $StockTable, StockData> {
  $$StockTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$StockinTable, List<StockinData>>
      _stockinRefsTable(_$Dbhelper db) =>
          MultiTypedResultKey.fromTable(db.stockin,
              aliasName: $_aliasNameGenerator(db.stock.id, db.stockin.stockId));

  $$StockinTableProcessedTableManager get stockinRefs {
    final manager = $$StockinTableTableManager($_db, $_db.stockin)
        .filter((f) => f.stockId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_stockinRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$StockoutTable, List<StockoutData>>
      _stockoutRefsTable(_$Dbhelper db) => MultiTypedResultKey.fromTable(
          db.stockout,
          aliasName: $_aliasNameGenerator(db.stock.id, db.stockout.stockId));

  $$StockoutTableProcessedTableManager get stockoutRefs {
    final manager = $$StockoutTableTableManager($_db, $_db.stockout)
        .filter((f) => f.stockId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_stockoutRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$StockTableFilterComposer extends Composer<_$Dbhelper, $StockTable> {
  $$StockTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get stok => $composableBuilder(
      column: $table.stok, builder: (column) => ColumnFilters(column));

  Expression<bool> stockinRefs(
      Expression<bool> Function($$StockinTableFilterComposer f) f) {
    final $$StockinTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.stockin,
        getReferencedColumn: (t) => t.stockId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StockinTableFilterComposer(
              $db: $db,
              $table: $db.stockin,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> stockoutRefs(
      Expression<bool> Function($$StockoutTableFilterComposer f) f) {
    final $$StockoutTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.stockout,
        getReferencedColumn: (t) => t.stockId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StockoutTableFilterComposer(
              $db: $db,
              $table: $db.stockout,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$StockTableOrderingComposer extends Composer<_$Dbhelper, $StockTable> {
  $$StockTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get stok => $composableBuilder(
      column: $table.stok, builder: (column) => ColumnOrderings(column));
}

class $$StockTableAnnotationComposer extends Composer<_$Dbhelper, $StockTable> {
  $$StockTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get stok =>
      $composableBuilder(column: $table.stok, builder: (column) => column);

  Expression<T> stockinRefs<T extends Object>(
      Expression<T> Function($$StockinTableAnnotationComposer a) f) {
    final $$StockinTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.stockin,
        getReferencedColumn: (t) => t.stockId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StockinTableAnnotationComposer(
              $db: $db,
              $table: $db.stockin,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> stockoutRefs<T extends Object>(
      Expression<T> Function($$StockoutTableAnnotationComposer a) f) {
    final $$StockoutTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.stockout,
        getReferencedColumn: (t) => t.stockId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StockoutTableAnnotationComposer(
              $db: $db,
              $table: $db.stockout,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$StockTableTableManager extends RootTableManager<
    _$Dbhelper,
    $StockTable,
    StockData,
    $$StockTableFilterComposer,
    $$StockTableOrderingComposer,
    $$StockTableAnnotationComposer,
    $$StockTableCreateCompanionBuilder,
    $$StockTableUpdateCompanionBuilder,
    (StockData, $$StockTableReferences),
    StockData,
    PrefetchHooks Function({bool stockinRefs, bool stockoutRefs})> {
  $$StockTableTableManager(_$Dbhelper db, $StockTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StockTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StockTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StockTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> stok = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StockCompanion(
            id: id,
            name: name,
            stok: stok,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required int stok,
            Value<int> rowid = const Value.absent(),
          }) =>
              StockCompanion.insert(
            id: id,
            name: name,
            stok: stok,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$StockTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({stockinRefs = false, stockoutRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (stockinRefs) db.stockin,
                if (stockoutRefs) db.stockout
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (stockinRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$StockTableReferences._stockinRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$StockTableReferences(db, table, p0).stockinRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.stockId == item.id),
                        typedResults: items),
                  if (stockoutRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$StockTableReferences._stockoutRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$StockTableReferences(db, table, p0).stockoutRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.stockId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$StockTableProcessedTableManager = ProcessedTableManager<
    _$Dbhelper,
    $StockTable,
    StockData,
    $$StockTableFilterComposer,
    $$StockTableOrderingComposer,
    $$StockTableAnnotationComposer,
    $$StockTableCreateCompanionBuilder,
    $$StockTableUpdateCompanionBuilder,
    (StockData, $$StockTableReferences),
    StockData,
    PrefetchHooks Function({bool stockinRefs, bool stockoutRefs})>;
typedef $$StockinTableCreateCompanionBuilder = StockinCompanion Function({
  required String id,
  Value<String?> stockId,
  required int stock,
  Value<DateTime?> date,
  Value<int> rowid,
});
typedef $$StockinTableUpdateCompanionBuilder = StockinCompanion Function({
  Value<String> id,
  Value<String?> stockId,
  Value<int> stock,
  Value<DateTime?> date,
  Value<int> rowid,
});

final class $$StockinTableReferences
    extends BaseReferences<_$Dbhelper, $StockinTable, StockinData> {
  $$StockinTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $StockTable _stockIdTable(_$Dbhelper db) => db.stock
      .createAlias($_aliasNameGenerator(db.stockin.stockId, db.stock.id));

  $$StockTableProcessedTableManager? get stockId {
    if ($_item.stockId == null) return null;
    final manager = $$StockTableTableManager($_db, $_db.stock)
        .filter((f) => f.id($_item.stockId!));
    final item = $_typedResult.readTableOrNull(_stockIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$StockinTableFilterComposer extends Composer<_$Dbhelper, $StockinTable> {
  $$StockinTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get stock => $composableBuilder(
      column: $table.stock, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  $$StockTableFilterComposer get stockId {
    final $$StockTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.stockId,
        referencedTable: $db.stock,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StockTableFilterComposer(
              $db: $db,
              $table: $db.stock,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StockinTableOrderingComposer
    extends Composer<_$Dbhelper, $StockinTable> {
  $$StockinTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get stock => $composableBuilder(
      column: $table.stock, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  $$StockTableOrderingComposer get stockId {
    final $$StockTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.stockId,
        referencedTable: $db.stock,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StockTableOrderingComposer(
              $db: $db,
              $table: $db.stock,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StockinTableAnnotationComposer
    extends Composer<_$Dbhelper, $StockinTable> {
  $$StockinTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get stock =>
      $composableBuilder(column: $table.stock, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  $$StockTableAnnotationComposer get stockId {
    final $$StockTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.stockId,
        referencedTable: $db.stock,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StockTableAnnotationComposer(
              $db: $db,
              $table: $db.stock,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StockinTableTableManager extends RootTableManager<
    _$Dbhelper,
    $StockinTable,
    StockinData,
    $$StockinTableFilterComposer,
    $$StockinTableOrderingComposer,
    $$StockinTableAnnotationComposer,
    $$StockinTableCreateCompanionBuilder,
    $$StockinTableUpdateCompanionBuilder,
    (StockinData, $$StockinTableReferences),
    StockinData,
    PrefetchHooks Function({bool stockId})> {
  $$StockinTableTableManager(_$Dbhelper db, $StockinTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StockinTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StockinTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StockinTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> stockId = const Value.absent(),
            Value<int> stock = const Value.absent(),
            Value<DateTime?> date = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StockinCompanion(
            id: id,
            stockId: stockId,
            stock: stock,
            date: date,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> stockId = const Value.absent(),
            required int stock,
            Value<DateTime?> date = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StockinCompanion.insert(
            id: id,
            stockId: stockId,
            stock: stock,
            date: date,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$StockinTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({stockId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (stockId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.stockId,
                    referencedTable: $$StockinTableReferences._stockIdTable(db),
                    referencedColumn:
                        $$StockinTableReferences._stockIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$StockinTableProcessedTableManager = ProcessedTableManager<
    _$Dbhelper,
    $StockinTable,
    StockinData,
    $$StockinTableFilterComposer,
    $$StockinTableOrderingComposer,
    $$StockinTableAnnotationComposer,
    $$StockinTableCreateCompanionBuilder,
    $$StockinTableUpdateCompanionBuilder,
    (StockinData, $$StockinTableReferences),
    StockinData,
    PrefetchHooks Function({bool stockId})>;
typedef $$StockoutTableCreateCompanionBuilder = StockoutCompanion Function({
  required String id,
  Value<String?> stockId,
  required int stock,
  Value<DateTime?> date,
  Value<int> rowid,
});
typedef $$StockoutTableUpdateCompanionBuilder = StockoutCompanion Function({
  Value<String> id,
  Value<String?> stockId,
  Value<int> stock,
  Value<DateTime?> date,
  Value<int> rowid,
});

final class $$StockoutTableReferences
    extends BaseReferences<_$Dbhelper, $StockoutTable, StockoutData> {
  $$StockoutTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $StockTable _stockIdTable(_$Dbhelper db) => db.stock
      .createAlias($_aliasNameGenerator(db.stockout.stockId, db.stock.id));

  $$StockTableProcessedTableManager? get stockId {
    if ($_item.stockId == null) return null;
    final manager = $$StockTableTableManager($_db, $_db.stock)
        .filter((f) => f.id($_item.stockId!));
    final item = $_typedResult.readTableOrNull(_stockIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$StockoutTableFilterComposer
    extends Composer<_$Dbhelper, $StockoutTable> {
  $$StockoutTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get stock => $composableBuilder(
      column: $table.stock, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  $$StockTableFilterComposer get stockId {
    final $$StockTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.stockId,
        referencedTable: $db.stock,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StockTableFilterComposer(
              $db: $db,
              $table: $db.stock,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StockoutTableOrderingComposer
    extends Composer<_$Dbhelper, $StockoutTable> {
  $$StockoutTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get stock => $composableBuilder(
      column: $table.stock, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  $$StockTableOrderingComposer get stockId {
    final $$StockTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.stockId,
        referencedTable: $db.stock,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StockTableOrderingComposer(
              $db: $db,
              $table: $db.stock,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StockoutTableAnnotationComposer
    extends Composer<_$Dbhelper, $StockoutTable> {
  $$StockoutTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get stock =>
      $composableBuilder(column: $table.stock, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  $$StockTableAnnotationComposer get stockId {
    final $$StockTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.stockId,
        referencedTable: $db.stock,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StockTableAnnotationComposer(
              $db: $db,
              $table: $db.stock,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$StockoutTableTableManager extends RootTableManager<
    _$Dbhelper,
    $StockoutTable,
    StockoutData,
    $$StockoutTableFilterComposer,
    $$StockoutTableOrderingComposer,
    $$StockoutTableAnnotationComposer,
    $$StockoutTableCreateCompanionBuilder,
    $$StockoutTableUpdateCompanionBuilder,
    (StockoutData, $$StockoutTableReferences),
    StockoutData,
    PrefetchHooks Function({bool stockId})> {
  $$StockoutTableTableManager(_$Dbhelper db, $StockoutTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StockoutTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StockoutTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StockoutTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> stockId = const Value.absent(),
            Value<int> stock = const Value.absent(),
            Value<DateTime?> date = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StockoutCompanion(
            id: id,
            stockId: stockId,
            stock: stock,
            date: date,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> stockId = const Value.absent(),
            required int stock,
            Value<DateTime?> date = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StockoutCompanion.insert(
            id: id,
            stockId: stockId,
            stock: stock,
            date: date,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$StockoutTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({stockId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (stockId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.stockId,
                    referencedTable:
                        $$StockoutTableReferences._stockIdTable(db),
                    referencedColumn:
                        $$StockoutTableReferences._stockIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$StockoutTableProcessedTableManager = ProcessedTableManager<
    _$Dbhelper,
    $StockoutTable,
    StockoutData,
    $$StockoutTableFilterComposer,
    $$StockoutTableOrderingComposer,
    $$StockoutTableAnnotationComposer,
    $$StockoutTableCreateCompanionBuilder,
    $$StockoutTableUpdateCompanionBuilder,
    (StockoutData, $$StockoutTableReferences),
    StockoutData,
    PrefetchHooks Function({bool stockId})>;

class $DbhelperManager {
  final _$Dbhelper _db;
  $DbhelperManager(this._db);
  $$StockTableTableManager get stock =>
      $$StockTableTableManager(_db, _db.stock);
  $$StockinTableTableManager get stockin =>
      $$StockinTableTableManager(_db, _db.stockin);
  $$StockoutTableTableManager get stockout =>
      $$StockoutTableTableManager(_db, _db.stockout);
}
