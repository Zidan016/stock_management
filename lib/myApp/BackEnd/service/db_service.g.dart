// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_service.dart';

// ignore_for_file: type=lint
class $CategoryTable extends Category
    with TableInfo<$CategoryTable, CategoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, name, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $CategoryTable createAlias(String alias) {
    return $CategoryTable(attachedDatabase, alias);
  }
}

class CategoryData extends DataClass implements Insertable<CategoryData> {
  final int id;
  final String name;
  final DateTime createdAt;
  const CategoryData(
      {required this.id, required this.name, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CategoryCompanion toCompanion(bool nullToAbsent) {
    return CategoryCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
    );
  }

  factory CategoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CategoryData copyWith({int? id, String? name, DateTime? createdAt}) =>
      CategoryData(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
      );
  CategoryData copyWithCompanion(CategoryCompanion data) {
    return CategoryData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryData &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt);
}

class CategoryCompanion extends UpdateCompanion<CategoryData> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> createdAt;
  const CategoryCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CategoryCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.createdAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<CategoryData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CategoryCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<DateTime>? createdAt}) {
    return CategoryCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PaymentTable extends Payment with TableInfo<$PaymentTable, PaymentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, name, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payment';
  @override
  VerificationContext validateIntegrity(Insertable<PaymentData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PaymentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PaymentData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $PaymentTable createAlias(String alias) {
    return $PaymentTable(attachedDatabase, alias);
  }
}

class PaymentData extends DataClass implements Insertable<PaymentData> {
  final int id;
  final String name;
  final DateTime createdAt;
  const PaymentData(
      {required this.id, required this.name, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PaymentCompanion toCompanion(bool nullToAbsent) {
    return PaymentCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
    );
  }

  factory PaymentData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PaymentData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PaymentData copyWith({int? id, String? name, DateTime? createdAt}) =>
      PaymentData(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
      );
  PaymentData copyWithCompanion(PaymentCompanion data) {
    return PaymentData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PaymentData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaymentData &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt);
}

class PaymentCompanion extends UpdateCompanion<PaymentData> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> createdAt;
  const PaymentCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PaymentCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.createdAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<PaymentData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PaymentCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<DateTime>? createdAt}) {
    return PaymentCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => uuidGenerate());
  static const VerificationMeta _uniqeCodeMeta =
      const VerificationMeta('uniqeCode');
  @override
  late final GeneratedColumn<String> uniqeCode = GeneratedColumn<String>(
      'uniqe_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => generateUniqueCode());
  static const VerificationMeta _paymentIdMeta =
      const VerificationMeta('paymentId');
  @override
  late final GeneratedColumn<int> paymentId = GeneratedColumn<int>(
      'payment_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES payment (id)'));
  static const VerificationMeta _customerMeta =
      const VerificationMeta('customer');
  @override
  late final GeneratedColumn<String> customer = GeneratedColumn<String>(
      'customer', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _totalPriceMeta =
      const VerificationMeta('totalPrice');
  @override
  late final GeneratedColumn<double> totalPrice = GeneratedColumn<double>(
      'total_price', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _totalPaidMeta =
      const VerificationMeta('totalPaid');
  @override
  late final GeneratedColumn<double> totalPaid = GeneratedColumn<double>(
      'total_paid', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _totalRefundMeta =
      const VerificationMeta('totalRefund');
  @override
  late final GeneratedColumn<double> totalRefund = GeneratedColumn<double>(
      'total_refund', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _isPendingMeta =
      const VerificationMeta('isPending');
  @override
  late final GeneratedColumn<bool> isPending = GeneratedColumn<bool>(
      'is_pending', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_pending" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        uniqeCode,
        paymentId,
        customer,
        totalPrice,
        totalPaid,
        totalRefund,
        isPending,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction';
  @override
  VerificationContext validateIntegrity(Insertable<Transaction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uniqe_code')) {
      context.handle(_uniqeCodeMeta,
          uniqeCode.isAcceptableOrUnknown(data['uniqe_code']!, _uniqeCodeMeta));
    }
    if (data.containsKey('payment_id')) {
      context.handle(_paymentIdMeta,
          paymentId.isAcceptableOrUnknown(data['payment_id']!, _paymentIdMeta));
    }
    if (data.containsKey('customer')) {
      context.handle(_customerMeta,
          customer.isAcceptableOrUnknown(data['customer']!, _customerMeta));
    }
    if (data.containsKey('total_price')) {
      context.handle(
          _totalPriceMeta,
          totalPrice.isAcceptableOrUnknown(
              data['total_price']!, _totalPriceMeta));
    }
    if (data.containsKey('total_paid')) {
      context.handle(_totalPaidMeta,
          totalPaid.isAcceptableOrUnknown(data['total_paid']!, _totalPaidMeta));
    }
    if (data.containsKey('total_refund')) {
      context.handle(
          _totalRefundMeta,
          totalRefund.isAcceptableOrUnknown(
              data['total_refund']!, _totalRefundMeta));
    }
    if (data.containsKey('is_pending')) {
      context.handle(_isPendingMeta,
          isPending.isAcceptableOrUnknown(data['is_pending']!, _isPendingMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Transaction(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      uniqeCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uniqe_code'])!,
      paymentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}payment_id']),
      customer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer']),
      totalPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_price'])!,
      totalPaid: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_paid'])!,
      totalRefund: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_refund'])!,
      isPending: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_pending'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

class Transaction extends DataClass implements Insertable<Transaction> {
  final String id;
  final String uniqeCode;
  final int? paymentId;
  final String? customer;
  final double totalPrice;
  final double totalPaid;
  final double totalRefund;
  final bool isPending;
  final DateTime createdAt;
  const Transaction(
      {required this.id,
      required this.uniqeCode,
      this.paymentId,
      this.customer,
      required this.totalPrice,
      required this.totalPaid,
      required this.totalRefund,
      required this.isPending,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['uniqe_code'] = Variable<String>(uniqeCode);
    if (!nullToAbsent || paymentId != null) {
      map['payment_id'] = Variable<int>(paymentId);
    }
    if (!nullToAbsent || customer != null) {
      map['customer'] = Variable<String>(customer);
    }
    map['total_price'] = Variable<double>(totalPrice);
    map['total_paid'] = Variable<double>(totalPaid);
    map['total_refund'] = Variable<double>(totalRefund);
    map['is_pending'] = Variable<bool>(isPending);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      uniqeCode: Value(uniqeCode),
      paymentId: paymentId == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentId),
      customer: customer == null && nullToAbsent
          ? const Value.absent()
          : Value(customer),
      totalPrice: Value(totalPrice),
      totalPaid: Value(totalPaid),
      totalRefund: Value(totalRefund),
      isPending: Value(isPending),
      createdAt: Value(createdAt),
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<String>(json['id']),
      uniqeCode: serializer.fromJson<String>(json['uniqeCode']),
      paymentId: serializer.fromJson<int?>(json['paymentId']),
      customer: serializer.fromJson<String?>(json['customer']),
      totalPrice: serializer.fromJson<double>(json['totalPrice']),
      totalPaid: serializer.fromJson<double>(json['totalPaid']),
      totalRefund: serializer.fromJson<double>(json['totalRefund']),
      isPending: serializer.fromJson<bool>(json['isPending']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'uniqeCode': serializer.toJson<String>(uniqeCode),
      'paymentId': serializer.toJson<int?>(paymentId),
      'customer': serializer.toJson<String?>(customer),
      'totalPrice': serializer.toJson<double>(totalPrice),
      'totalPaid': serializer.toJson<double>(totalPaid),
      'totalRefund': serializer.toJson<double>(totalRefund),
      'isPending': serializer.toJson<bool>(isPending),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Transaction copyWith(
          {String? id,
          String? uniqeCode,
          Value<int?> paymentId = const Value.absent(),
          Value<String?> customer = const Value.absent(),
          double? totalPrice,
          double? totalPaid,
          double? totalRefund,
          bool? isPending,
          DateTime? createdAt}) =>
      Transaction(
        id: id ?? this.id,
        uniqeCode: uniqeCode ?? this.uniqeCode,
        paymentId: paymentId.present ? paymentId.value : this.paymentId,
        customer: customer.present ? customer.value : this.customer,
        totalPrice: totalPrice ?? this.totalPrice,
        totalPaid: totalPaid ?? this.totalPaid,
        totalRefund: totalRefund ?? this.totalRefund,
        isPending: isPending ?? this.isPending,
        createdAt: createdAt ?? this.createdAt,
      );
  Transaction copyWithCompanion(TransactionsCompanion data) {
    return Transaction(
      id: data.id.present ? data.id.value : this.id,
      uniqeCode: data.uniqeCode.present ? data.uniqeCode.value : this.uniqeCode,
      paymentId: data.paymentId.present ? data.paymentId.value : this.paymentId,
      customer: data.customer.present ? data.customer.value : this.customer,
      totalPrice:
          data.totalPrice.present ? data.totalPrice.value : this.totalPrice,
      totalPaid: data.totalPaid.present ? data.totalPaid.value : this.totalPaid,
      totalRefund:
          data.totalRefund.present ? data.totalRefund.value : this.totalRefund,
      isPending: data.isPending.present ? data.isPending.value : this.isPending,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('uniqeCode: $uniqeCode, ')
          ..write('paymentId: $paymentId, ')
          ..write('customer: $customer, ')
          ..write('totalPrice: $totalPrice, ')
          ..write('totalPaid: $totalPaid, ')
          ..write('totalRefund: $totalRefund, ')
          ..write('isPending: $isPending, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, uniqeCode, paymentId, customer,
      totalPrice, totalPaid, totalRefund, isPending, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.uniqeCode == this.uniqeCode &&
          other.paymentId == this.paymentId &&
          other.customer == this.customer &&
          other.totalPrice == this.totalPrice &&
          other.totalPaid == this.totalPaid &&
          other.totalRefund == this.totalRefund &&
          other.isPending == this.isPending &&
          other.createdAt == this.createdAt);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<String> id;
  final Value<String> uniqeCode;
  final Value<int?> paymentId;
  final Value<String?> customer;
  final Value<double> totalPrice;
  final Value<double> totalPaid;
  final Value<double> totalRefund;
  final Value<bool> isPending;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.uniqeCode = const Value.absent(),
    this.paymentId = const Value.absent(),
    this.customer = const Value.absent(),
    this.totalPrice = const Value.absent(),
    this.totalPaid = const Value.absent(),
    this.totalRefund = const Value.absent(),
    this.isPending = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.id = const Value.absent(),
    this.uniqeCode = const Value.absent(),
    this.paymentId = const Value.absent(),
    this.customer = const Value.absent(),
    this.totalPrice = const Value.absent(),
    this.totalPaid = const Value.absent(),
    this.totalRefund = const Value.absent(),
    this.isPending = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<Transaction> custom({
    Expression<String>? id,
    Expression<String>? uniqeCode,
    Expression<int>? paymentId,
    Expression<String>? customer,
    Expression<double>? totalPrice,
    Expression<double>? totalPaid,
    Expression<double>? totalRefund,
    Expression<bool>? isPending,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uniqeCode != null) 'uniqe_code': uniqeCode,
      if (paymentId != null) 'payment_id': paymentId,
      if (customer != null) 'customer': customer,
      if (totalPrice != null) 'total_price': totalPrice,
      if (totalPaid != null) 'total_paid': totalPaid,
      if (totalRefund != null) 'total_refund': totalRefund,
      if (isPending != null) 'is_pending': isPending,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionsCompanion copyWith(
      {Value<String>? id,
      Value<String>? uniqeCode,
      Value<int?>? paymentId,
      Value<String?>? customer,
      Value<double>? totalPrice,
      Value<double>? totalPaid,
      Value<double>? totalRefund,
      Value<bool>? isPending,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return TransactionsCompanion(
      id: id ?? this.id,
      uniqeCode: uniqeCode ?? this.uniqeCode,
      paymentId: paymentId ?? this.paymentId,
      customer: customer ?? this.customer,
      totalPrice: totalPrice ?? this.totalPrice,
      totalPaid: totalPaid ?? this.totalPaid,
      totalRefund: totalRefund ?? this.totalRefund,
      isPending: isPending ?? this.isPending,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (uniqeCode.present) {
      map['uniqe_code'] = Variable<String>(uniqeCode.value);
    }
    if (paymentId.present) {
      map['payment_id'] = Variable<int>(paymentId.value);
    }
    if (customer.present) {
      map['customer'] = Variable<String>(customer.value);
    }
    if (totalPrice.present) {
      map['total_price'] = Variable<double>(totalPrice.value);
    }
    if (totalPaid.present) {
      map['total_paid'] = Variable<double>(totalPaid.value);
    }
    if (totalRefund.present) {
      map['total_refund'] = Variable<double>(totalRefund.value);
    }
    if (isPending.present) {
      map['is_pending'] = Variable<bool>(isPending.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('uniqeCode: $uniqeCode, ')
          ..write('paymentId: $paymentId, ')
          ..write('customer: $customer, ')
          ..write('totalPrice: $totalPrice, ')
          ..write('totalPaid: $totalPaid, ')
          ..write('totalRefund: $totalRefund, ')
          ..write('isPending: $isPending, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductTable extends Product with TableInfo<$ProductTable, ProductData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => uuidGenerate());
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES category (id)'));
  static const VerificationMeta _namaMeta = const VerificationMeta('nama');
  @override
  late final GeneratedColumn<String> nama = GeneratedColumn<String>(
      'nama', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _stockMeta = const VerificationMeta('stock');
  @override
  late final GeneratedColumn<int> stock = GeneratedColumn<int>(
      'stock', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _hargaMeta = const VerificationMeta('harga');
  @override
  late final GeneratedColumn<double> harga = GeneratedColumn<double>(
      'harga', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, categoryId, nama, stock, harga, description, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product';
  @override
  VerificationContext validateIntegrity(Insertable<ProductData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    if (data.containsKey('nama')) {
      context.handle(
          _namaMeta, nama.isAcceptableOrUnknown(data['nama']!, _namaMeta));
    } else if (isInserting) {
      context.missing(_namaMeta);
    }
    if (data.containsKey('stock')) {
      context.handle(
          _stockMeta, stock.isAcceptableOrUnknown(data['stock']!, _stockMeta));
    }
    if (data.containsKey('harga')) {
      context.handle(
          _hargaMeta, harga.isAcceptableOrUnknown(data['harga']!, _hargaMeta));
    } else if (isInserting) {
      context.missing(_hargaMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id']),
      nama: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nama'])!,
      stock: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}stock'])!,
      harga: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}harga'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $ProductTable createAlias(String alias) {
    return $ProductTable(attachedDatabase, alias);
  }
}

class ProductData extends DataClass implements Insertable<ProductData> {
  final String id;
  final int? categoryId;
  final String nama;
  final int stock;
  final double harga;
  final String? description;
  final DateTime createdAt;
  const ProductData(
      {required this.id,
      this.categoryId,
      required this.nama,
      required this.stock,
      required this.harga,
      this.description,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int>(categoryId);
    }
    map['nama'] = Variable<String>(nama);
    map['stock'] = Variable<int>(stock);
    map['harga'] = Variable<double>(harga);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ProductCompanion toCompanion(bool nullToAbsent) {
    return ProductCompanion(
      id: Value(id),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      nama: Value(nama),
      stock: Value(stock),
      harga: Value(harga),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdAt: Value(createdAt),
    );
  }

  factory ProductData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductData(
      id: serializer.fromJson<String>(json['id']),
      categoryId: serializer.fromJson<int?>(json['categoryId']),
      nama: serializer.fromJson<String>(json['nama']),
      stock: serializer.fromJson<int>(json['stock']),
      harga: serializer.fromJson<double>(json['harga']),
      description: serializer.fromJson<String?>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'categoryId': serializer.toJson<int?>(categoryId),
      'nama': serializer.toJson<String>(nama),
      'stock': serializer.toJson<int>(stock),
      'harga': serializer.toJson<double>(harga),
      'description': serializer.toJson<String?>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ProductData copyWith(
          {String? id,
          Value<int?> categoryId = const Value.absent(),
          String? nama,
          int? stock,
          double? harga,
          Value<String?> description = const Value.absent(),
          DateTime? createdAt}) =>
      ProductData(
        id: id ?? this.id,
        categoryId: categoryId.present ? categoryId.value : this.categoryId,
        nama: nama ?? this.nama,
        stock: stock ?? this.stock,
        harga: harga ?? this.harga,
        description: description.present ? description.value : this.description,
        createdAt: createdAt ?? this.createdAt,
      );
  ProductData copyWithCompanion(ProductCompanion data) {
    return ProductData(
      id: data.id.present ? data.id.value : this.id,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      nama: data.nama.present ? data.nama.value : this.nama,
      stock: data.stock.present ? data.stock.value : this.stock,
      harga: data.harga.present ? data.harga.value : this.harga,
      description:
          data.description.present ? data.description.value : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductData(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('nama: $nama, ')
          ..write('stock: $stock, ')
          ..write('harga: $harga, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, categoryId, nama, stock, harga, description, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductData &&
          other.id == this.id &&
          other.categoryId == this.categoryId &&
          other.nama == this.nama &&
          other.stock == this.stock &&
          other.harga == this.harga &&
          other.description == this.description &&
          other.createdAt == this.createdAt);
}

class ProductCompanion extends UpdateCompanion<ProductData> {
  final Value<String> id;
  final Value<int?> categoryId;
  final Value<String> nama;
  final Value<int> stock;
  final Value<double> harga;
  final Value<String?> description;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const ProductCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.nama = const Value.absent(),
    this.stock = const Value.absent(),
    this.harga = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductCompanion.insert({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    required String nama,
    this.stock = const Value.absent(),
    required double harga,
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : nama = Value(nama),
        harga = Value(harga);
  static Insertable<ProductData> custom({
    Expression<String>? id,
    Expression<int>? categoryId,
    Expression<String>? nama,
    Expression<int>? stock,
    Expression<double>? harga,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryId != null) 'category_id': categoryId,
      if (nama != null) 'nama': nama,
      if (stock != null) 'stock': stock,
      if (harga != null) 'harga': harga,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductCompanion copyWith(
      {Value<String>? id,
      Value<int?>? categoryId,
      Value<String>? nama,
      Value<int>? stock,
      Value<double>? harga,
      Value<String?>? description,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return ProductCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      nama: nama ?? this.nama,
      stock: stock ?? this.stock,
      harga: harga ?? this.harga,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (nama.present) {
      map['nama'] = Variable<String>(nama.value);
    }
    if (stock.present) {
      map['stock'] = Variable<int>(stock.value);
    }
    if (harga.present) {
      map['harga'] = Variable<double>(harga.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductCompanion(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('nama: $nama, ')
          ..write('stock: $stock, ')
          ..write('harga: $harga, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TransactionItemTable extends TransactionItem
    with TableInfo<$TransactionItemTable, TransactionItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => uuidGenerate());
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES product (id)'));
  static const VerificationMeta _transactionIdMeta =
      const VerificationMeta('transactionId');
  @override
  late final GeneratedColumn<String> transactionId = GeneratedColumn<String>(
      'transaction_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES "transaction" (id)'));
  static const VerificationMeta _qtyMeta = const VerificationMeta('qty');
  @override
  late final GeneratedColumn<int> qty = GeneratedColumn<int>(
      'qty', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, productId, transactionId, qty, price, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_item';
  @override
  VerificationContext validateIntegrity(
      Insertable<TransactionItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
          _transactionIdMeta,
          transactionId.isAcceptableOrUnknown(
              data['transaction_id']!, _transactionIdMeta));
    }
    if (data.containsKey('qty')) {
      context.handle(
          _qtyMeta, qty.isAcceptableOrUnknown(data['qty']!, _qtyMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionItemData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id']),
      transactionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}transaction_id']),
      qty: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}qty'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $TransactionItemTable createAlias(String alias) {
    return $TransactionItemTable(attachedDatabase, alias);
  }
}

class TransactionItemData extends DataClass
    implements Insertable<TransactionItemData> {
  final String id;
  final String? productId;
  final String? transactionId;
  final int qty;
  final double price;
  final DateTime createdAt;
  const TransactionItemData(
      {required this.id,
      this.productId,
      this.transactionId,
      required this.qty,
      required this.price,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || productId != null) {
      map['product_id'] = Variable<String>(productId);
    }
    if (!nullToAbsent || transactionId != null) {
      map['transaction_id'] = Variable<String>(transactionId);
    }
    map['qty'] = Variable<int>(qty);
    map['price'] = Variable<double>(price);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TransactionItemCompanion toCompanion(bool nullToAbsent) {
    return TransactionItemCompanion(
      id: Value(id),
      productId: productId == null && nullToAbsent
          ? const Value.absent()
          : Value(productId),
      transactionId: transactionId == null && nullToAbsent
          ? const Value.absent()
          : Value(transactionId),
      qty: Value(qty),
      price: Value(price),
      createdAt: Value(createdAt),
    );
  }

  factory TransactionItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionItemData(
      id: serializer.fromJson<String>(json['id']),
      productId: serializer.fromJson<String?>(json['productId']),
      transactionId: serializer.fromJson<String?>(json['transactionId']),
      qty: serializer.fromJson<int>(json['qty']),
      price: serializer.fromJson<double>(json['price']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'productId': serializer.toJson<String?>(productId),
      'transactionId': serializer.toJson<String?>(transactionId),
      'qty': serializer.toJson<int>(qty),
      'price': serializer.toJson<double>(price),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TransactionItemData copyWith(
          {String? id,
          Value<String?> productId = const Value.absent(),
          Value<String?> transactionId = const Value.absent(),
          int? qty,
          double? price,
          DateTime? createdAt}) =>
      TransactionItemData(
        id: id ?? this.id,
        productId: productId.present ? productId.value : this.productId,
        transactionId:
            transactionId.present ? transactionId.value : this.transactionId,
        qty: qty ?? this.qty,
        price: price ?? this.price,
        createdAt: createdAt ?? this.createdAt,
      );
  TransactionItemData copyWithCompanion(TransactionItemCompanion data) {
    return TransactionItemData(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
      qty: data.qty.present ? data.qty.value : this.qty,
      price: data.price.present ? data.price.value : this.price,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionItemData(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('transactionId: $transactionId, ')
          ..write('qty: $qty, ')
          ..write('price: $price, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, productId, transactionId, qty, price, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionItemData &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.transactionId == this.transactionId &&
          other.qty == this.qty &&
          other.price == this.price &&
          other.createdAt == this.createdAt);
}

class TransactionItemCompanion extends UpdateCompanion<TransactionItemData> {
  final Value<String> id;
  final Value<String?> productId;
  final Value<String?> transactionId;
  final Value<int> qty;
  final Value<double> price;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const TransactionItemCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.qty = const Value.absent(),
    this.price = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionItemCompanion.insert({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.qty = const Value.absent(),
    this.price = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<TransactionItemData> custom({
    Expression<String>? id,
    Expression<String>? productId,
    Expression<String>? transactionId,
    Expression<int>? qty,
    Expression<double>? price,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (transactionId != null) 'transaction_id': transactionId,
      if (qty != null) 'qty': qty,
      if (price != null) 'price': price,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionItemCompanion copyWith(
      {Value<String>? id,
      Value<String?>? productId,
      Value<String?>? transactionId,
      Value<int>? qty,
      Value<double>? price,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return TransactionItemCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      transactionId: transactionId ?? this.transactionId,
      qty: qty ?? this.qty,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<String>(transactionId.value);
    }
    if (qty.present) {
      map['qty'] = Variable<int>(qty.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionItemCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('transactionId: $transactionId, ')
          ..write('qty: $qty, ')
          ..write('price: $price, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$DbService extends GeneratedDatabase {
  _$DbService(QueryExecutor e) : super(e);
  $DbServiceManager get managers => $DbServiceManager(this);
  late final $CategoryTable category = $CategoryTable(this);
  late final $PaymentTable payment = $PaymentTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $ProductTable product = $ProductTable(this);
  late final $TransactionItemTable transactionItem =
      $TransactionItemTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [category, payment, transactions, product, transactionItem];
}

typedef $$CategoryTableCreateCompanionBuilder = CategoryCompanion Function({
  Value<int> id,
  required String name,
  Value<DateTime> createdAt,
});
typedef $$CategoryTableUpdateCompanionBuilder = CategoryCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime> createdAt,
});

final class $$CategoryTableReferences
    extends BaseReferences<_$DbService, $CategoryTable, CategoryData> {
  $$CategoryTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProductTable, List<ProductData>>
      _productRefsTable(_$DbService db) => MultiTypedResultKey.fromTable(
          db.product,
          aliasName:
              $_aliasNameGenerator(db.category.id, db.product.categoryId));

  $$ProductTableProcessedTableManager get productRefs {
    final manager = $$ProductTableTableManager($_db, $_db.product)
        .filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_productRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CategoryTableFilterComposer
    extends Composer<_$DbService, $CategoryTable> {
  $$CategoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  Expression<bool> productRefs(
      Expression<bool> Function($$ProductTableFilterComposer f) f) {
    final $$ProductTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.product,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductTableFilterComposer(
              $db: $db,
              $table: $db.product,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CategoryTableOrderingComposer
    extends Composer<_$DbService, $CategoryTable> {
  $$CategoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$CategoryTableAnnotationComposer
    extends Composer<_$DbService, $CategoryTable> {
  $$CategoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> productRefs<T extends Object>(
      Expression<T> Function($$ProductTableAnnotationComposer a) f) {
    final $$ProductTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.product,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductTableAnnotationComposer(
              $db: $db,
              $table: $db.product,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CategoryTableTableManager extends RootTableManager<
    _$DbService,
    $CategoryTable,
    CategoryData,
    $$CategoryTableFilterComposer,
    $$CategoryTableOrderingComposer,
    $$CategoryTableAnnotationComposer,
    $$CategoryTableCreateCompanionBuilder,
    $$CategoryTableUpdateCompanionBuilder,
    (CategoryData, $$CategoryTableReferences),
    CategoryData,
    PrefetchHooks Function({bool productRefs})> {
  $$CategoryTableTableManager(_$DbService db, $CategoryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              CategoryCompanion(
            id: id,
            name: name,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              CategoryCompanion.insert(
            id: id,
            name: name,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$CategoryTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({productRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (productRefs) db.product],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productRefs)
                    await $_getPrefetchedData<CategoryData, $CategoryTable,
                            ProductData>(
                        currentTable: table,
                        referencedTable:
                            $$CategoryTableReferences._productRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CategoryTableReferences(db, table, p0)
                                .productRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CategoryTableProcessedTableManager = ProcessedTableManager<
    _$DbService,
    $CategoryTable,
    CategoryData,
    $$CategoryTableFilterComposer,
    $$CategoryTableOrderingComposer,
    $$CategoryTableAnnotationComposer,
    $$CategoryTableCreateCompanionBuilder,
    $$CategoryTableUpdateCompanionBuilder,
    (CategoryData, $$CategoryTableReferences),
    CategoryData,
    PrefetchHooks Function({bool productRefs})>;
typedef $$PaymentTableCreateCompanionBuilder = PaymentCompanion Function({
  Value<int> id,
  required String name,
  Value<DateTime> createdAt,
});
typedef $$PaymentTableUpdateCompanionBuilder = PaymentCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime> createdAt,
});

final class $$PaymentTableReferences
    extends BaseReferences<_$DbService, $PaymentTable, PaymentData> {
  $$PaymentTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
      _transactionsRefsTable(_$DbService db) => MultiTypedResultKey.fromTable(
          db.transactions,
          aliasName:
              $_aliasNameGenerator(db.payment.id, db.transactions.paymentId));

  $$TransactionsTableProcessedTableManager get transactionsRefs {
    final manager = $$TransactionsTableTableManager($_db, $_db.transactions)
        .filter((f) => f.paymentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PaymentTableFilterComposer
    extends Composer<_$DbService, $PaymentTable> {
  $$PaymentTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  Expression<bool> transactionsRefs(
      Expression<bool> Function($$TransactionsTableFilterComposer f) f) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.paymentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableFilterComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PaymentTableOrderingComposer
    extends Composer<_$DbService, $PaymentTable> {
  $$PaymentTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$PaymentTableAnnotationComposer
    extends Composer<_$DbService, $PaymentTable> {
  $$PaymentTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> transactionsRefs<T extends Object>(
      Expression<T> Function($$TransactionsTableAnnotationComposer a) f) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.paymentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableAnnotationComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PaymentTableTableManager extends RootTableManager<
    _$DbService,
    $PaymentTable,
    PaymentData,
    $$PaymentTableFilterComposer,
    $$PaymentTableOrderingComposer,
    $$PaymentTableAnnotationComposer,
    $$PaymentTableCreateCompanionBuilder,
    $$PaymentTableUpdateCompanionBuilder,
    (PaymentData, $$PaymentTableReferences),
    PaymentData,
    PrefetchHooks Function({bool transactionsRefs})> {
  $$PaymentTableTableManager(_$DbService db, $PaymentTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaymentTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              PaymentCompanion(
            id: id,
            name: name,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              PaymentCompanion.insert(
            id: id,
            name: name,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$PaymentTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({transactionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (transactionsRefs) db.transactions],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transactionsRefs)
                    await $_getPrefetchedData<PaymentData, $PaymentTable,
                            Transaction>(
                        currentTable: table,
                        referencedTable:
                            $$PaymentTableReferences._transactionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PaymentTableReferences(db, table, p0)
                                .transactionsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.paymentId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PaymentTableProcessedTableManager = ProcessedTableManager<
    _$DbService,
    $PaymentTable,
    PaymentData,
    $$PaymentTableFilterComposer,
    $$PaymentTableOrderingComposer,
    $$PaymentTableAnnotationComposer,
    $$PaymentTableCreateCompanionBuilder,
    $$PaymentTableUpdateCompanionBuilder,
    (PaymentData, $$PaymentTableReferences),
    PaymentData,
    PrefetchHooks Function({bool transactionsRefs})>;
typedef $$TransactionsTableCreateCompanionBuilder = TransactionsCompanion
    Function({
  Value<String> id,
  Value<String> uniqeCode,
  Value<int?> paymentId,
  Value<String?> customer,
  Value<double> totalPrice,
  Value<double> totalPaid,
  Value<double> totalRefund,
  Value<bool> isPending,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$TransactionsTableUpdateCompanionBuilder = TransactionsCompanion
    Function({
  Value<String> id,
  Value<String> uniqeCode,
  Value<int?> paymentId,
  Value<String?> customer,
  Value<double> totalPrice,
  Value<double> totalPaid,
  Value<double> totalRefund,
  Value<bool> isPending,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

final class $$TransactionsTableReferences
    extends BaseReferences<_$DbService, $TransactionsTable, Transaction> {
  $$TransactionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PaymentTable _paymentIdTable(_$DbService db) =>
      db.payment.createAlias(
          $_aliasNameGenerator(db.transactions.paymentId, db.payment.id));

  $$PaymentTableProcessedTableManager? get paymentId {
    final $_column = $_itemColumn<int>('payment_id');
    if ($_column == null) return null;
    final manager = $$PaymentTableTableManager($_db, $_db.payment)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_paymentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$TransactionItemTable, List<TransactionItemData>>
      _transactionItemRefsTable(_$DbService db) =>
          MultiTypedResultKey.fromTable(db.transactionItem,
              aliasName: $_aliasNameGenerator(
                  db.transactions.id, db.transactionItem.transactionId));

  $$TransactionItemTableProcessedTableManager get transactionItemRefs {
    final manager =
        $$TransactionItemTableTableManager($_db, $_db.transactionItem).filter(
            (f) => f.transactionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_transactionItemRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TransactionsTableFilterComposer
    extends Composer<_$DbService, $TransactionsTable> {
  $$TransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uniqeCode => $composableBuilder(
      column: $table.uniqeCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get customer => $composableBuilder(
      column: $table.customer, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalPrice => $composableBuilder(
      column: $table.totalPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalPaid => $composableBuilder(
      column: $table.totalPaid, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalRefund => $composableBuilder(
      column: $table.totalRefund, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isPending => $composableBuilder(
      column: $table.isPending, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$PaymentTableFilterComposer get paymentId {
    final $$PaymentTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.paymentId,
        referencedTable: $db.payment,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PaymentTableFilterComposer(
              $db: $db,
              $table: $db.payment,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> transactionItemRefs(
      Expression<bool> Function($$TransactionItemTableFilterComposer f) f) {
    final $$TransactionItemTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactionItem,
        getReferencedColumn: (t) => t.transactionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionItemTableFilterComposer(
              $db: $db,
              $table: $db.transactionItem,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TransactionsTableOrderingComposer
    extends Composer<_$DbService, $TransactionsTable> {
  $$TransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uniqeCode => $composableBuilder(
      column: $table.uniqeCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customer => $composableBuilder(
      column: $table.customer, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalPrice => $composableBuilder(
      column: $table.totalPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalPaid => $composableBuilder(
      column: $table.totalPaid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalRefund => $composableBuilder(
      column: $table.totalRefund, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isPending => $composableBuilder(
      column: $table.isPending, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$PaymentTableOrderingComposer get paymentId {
    final $$PaymentTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.paymentId,
        referencedTable: $db.payment,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PaymentTableOrderingComposer(
              $db: $db,
              $table: $db.payment,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TransactionsTableAnnotationComposer
    extends Composer<_$DbService, $TransactionsTable> {
  $$TransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uniqeCode =>
      $composableBuilder(column: $table.uniqeCode, builder: (column) => column);

  GeneratedColumn<String> get customer =>
      $composableBuilder(column: $table.customer, builder: (column) => column);

  GeneratedColumn<double> get totalPrice => $composableBuilder(
      column: $table.totalPrice, builder: (column) => column);

  GeneratedColumn<double> get totalPaid =>
      $composableBuilder(column: $table.totalPaid, builder: (column) => column);

  GeneratedColumn<double> get totalRefund => $composableBuilder(
      column: $table.totalRefund, builder: (column) => column);

  GeneratedColumn<bool> get isPending =>
      $composableBuilder(column: $table.isPending, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$PaymentTableAnnotationComposer get paymentId {
    final $$PaymentTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.paymentId,
        referencedTable: $db.payment,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PaymentTableAnnotationComposer(
              $db: $db,
              $table: $db.payment,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> transactionItemRefs<T extends Object>(
      Expression<T> Function($$TransactionItemTableAnnotationComposer a) f) {
    final $$TransactionItemTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactionItem,
        getReferencedColumn: (t) => t.transactionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionItemTableAnnotationComposer(
              $db: $db,
              $table: $db.transactionItem,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TransactionsTableTableManager extends RootTableManager<
    _$DbService,
    $TransactionsTable,
    Transaction,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableAnnotationComposer,
    $$TransactionsTableCreateCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder,
    (Transaction, $$TransactionsTableReferences),
    Transaction,
    PrefetchHooks Function({bool paymentId, bool transactionItemRefs})> {
  $$TransactionsTableTableManager(_$DbService db, $TransactionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> uniqeCode = const Value.absent(),
            Value<int?> paymentId = const Value.absent(),
            Value<String?> customer = const Value.absent(),
            Value<double> totalPrice = const Value.absent(),
            Value<double> totalPaid = const Value.absent(),
            Value<double> totalRefund = const Value.absent(),
            Value<bool> isPending = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TransactionsCompanion(
            id: id,
            uniqeCode: uniqeCode,
            paymentId: paymentId,
            customer: customer,
            totalPrice: totalPrice,
            totalPaid: totalPaid,
            totalRefund: totalRefund,
            isPending: isPending,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> uniqeCode = const Value.absent(),
            Value<int?> paymentId = const Value.absent(),
            Value<String?> customer = const Value.absent(),
            Value<double> totalPrice = const Value.absent(),
            Value<double> totalPaid = const Value.absent(),
            Value<double> totalRefund = const Value.absent(),
            Value<bool> isPending = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TransactionsCompanion.insert(
            id: id,
            uniqeCode: uniqeCode,
            paymentId: paymentId,
            customer: customer,
            totalPrice: totalPrice,
            totalPaid: totalPaid,
            totalRefund: totalRefund,
            isPending: isPending,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TransactionsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {paymentId = false, transactionItemRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (transactionItemRefs) db.transactionItem
              ],
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
                if (paymentId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.paymentId,
                    referencedTable:
                        $$TransactionsTableReferences._paymentIdTable(db),
                    referencedColumn:
                        $$TransactionsTableReferences._paymentIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transactionItemRefs)
                    await $_getPrefetchedData<Transaction, $TransactionsTable,
                            TransactionItemData>(
                        currentTable: table,
                        referencedTable: $$TransactionsTableReferences
                            ._transactionItemRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TransactionsTableReferences(db, table, p0)
                                .transactionItemRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.transactionId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TransactionsTableProcessedTableManager = ProcessedTableManager<
    _$DbService,
    $TransactionsTable,
    Transaction,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableAnnotationComposer,
    $$TransactionsTableCreateCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder,
    (Transaction, $$TransactionsTableReferences),
    Transaction,
    PrefetchHooks Function({bool paymentId, bool transactionItemRefs})>;
typedef $$ProductTableCreateCompanionBuilder = ProductCompanion Function({
  Value<String> id,
  Value<int?> categoryId,
  required String nama,
  Value<int> stock,
  required double harga,
  Value<String?> description,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$ProductTableUpdateCompanionBuilder = ProductCompanion Function({
  Value<String> id,
  Value<int?> categoryId,
  Value<String> nama,
  Value<int> stock,
  Value<double> harga,
  Value<String?> description,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

final class $$ProductTableReferences
    extends BaseReferences<_$DbService, $ProductTable, ProductData> {
  $$ProductTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CategoryTable _categoryIdTable(_$DbService db) => db.category
      .createAlias($_aliasNameGenerator(db.product.categoryId, db.category.id));

  $$CategoryTableProcessedTableManager? get categoryId {
    final $_column = $_itemColumn<int>('category_id');
    if ($_column == null) return null;
    final manager = $$CategoryTableTableManager($_db, $_db.category)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$TransactionItemTable, List<TransactionItemData>>
      _transactionItemRefsTable(_$DbService db) =>
          MultiTypedResultKey.fromTable(db.transactionItem,
              aliasName: $_aliasNameGenerator(
                  db.product.id, db.transactionItem.productId));

  $$TransactionItemTableProcessedTableManager get transactionItemRefs {
    final manager = $$TransactionItemTableTableManager(
            $_db, $_db.transactionItem)
        .filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_transactionItemRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ProductTableFilterComposer
    extends Composer<_$DbService, $ProductTable> {
  $$ProductTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nama => $composableBuilder(
      column: $table.nama, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get stock => $composableBuilder(
      column: $table.stock, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get harga => $composableBuilder(
      column: $table.harga, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$CategoryTableFilterComposer get categoryId {
    final $$CategoryTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.category,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoryTableFilterComposer(
              $db: $db,
              $table: $db.category,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> transactionItemRefs(
      Expression<bool> Function($$TransactionItemTableFilterComposer f) f) {
    final $$TransactionItemTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactionItem,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionItemTableFilterComposer(
              $db: $db,
              $table: $db.transactionItem,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ProductTableOrderingComposer
    extends Composer<_$DbService, $ProductTable> {
  $$ProductTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nama => $composableBuilder(
      column: $table.nama, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get stock => $composableBuilder(
      column: $table.stock, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get harga => $composableBuilder(
      column: $table.harga, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$CategoryTableOrderingComposer get categoryId {
    final $$CategoryTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.category,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoryTableOrderingComposer(
              $db: $db,
              $table: $db.category,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductTableAnnotationComposer
    extends Composer<_$DbService, $ProductTable> {
  $$ProductTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nama =>
      $composableBuilder(column: $table.nama, builder: (column) => column);

  GeneratedColumn<int> get stock =>
      $composableBuilder(column: $table.stock, builder: (column) => column);

  GeneratedColumn<double> get harga =>
      $composableBuilder(column: $table.harga, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$CategoryTableAnnotationComposer get categoryId {
    final $$CategoryTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.category,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoryTableAnnotationComposer(
              $db: $db,
              $table: $db.category,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> transactionItemRefs<T extends Object>(
      Expression<T> Function($$TransactionItemTableAnnotationComposer a) f) {
    final $$TransactionItemTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transactionItem,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionItemTableAnnotationComposer(
              $db: $db,
              $table: $db.transactionItem,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ProductTableTableManager extends RootTableManager<
    _$DbService,
    $ProductTable,
    ProductData,
    $$ProductTableFilterComposer,
    $$ProductTableOrderingComposer,
    $$ProductTableAnnotationComposer,
    $$ProductTableCreateCompanionBuilder,
    $$ProductTableUpdateCompanionBuilder,
    (ProductData, $$ProductTableReferences),
    ProductData,
    PrefetchHooks Function({bool categoryId, bool transactionItemRefs})> {
  $$ProductTableTableManager(_$DbService db, $ProductTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<int?> categoryId = const Value.absent(),
            Value<String> nama = const Value.absent(),
            Value<int> stock = const Value.absent(),
            Value<double> harga = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductCompanion(
            id: id,
            categoryId: categoryId,
            nama: nama,
            stock: stock,
            harga: harga,
            description: description,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<int?> categoryId = const Value.absent(),
            required String nama,
            Value<int> stock = const Value.absent(),
            required double harga,
            Value<String?> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductCompanion.insert(
            id: id,
            categoryId: categoryId,
            nama: nama,
            stock: stock,
            harga: harga,
            description: description,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ProductTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {categoryId = false, transactionItemRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (transactionItemRefs) db.transactionItem
              ],
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
                if (categoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable:
                        $$ProductTableReferences._categoryIdTable(db),
                    referencedColumn:
                        $$ProductTableReferences._categoryIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transactionItemRefs)
                    await $_getPrefetchedData<ProductData, $ProductTable,
                            TransactionItemData>(
                        currentTable: table,
                        referencedTable: $$ProductTableReferences
                            ._transactionItemRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProductTableReferences(db, table, p0)
                                .transactionItemRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ProductTableProcessedTableManager = ProcessedTableManager<
    _$DbService,
    $ProductTable,
    ProductData,
    $$ProductTableFilterComposer,
    $$ProductTableOrderingComposer,
    $$ProductTableAnnotationComposer,
    $$ProductTableCreateCompanionBuilder,
    $$ProductTableUpdateCompanionBuilder,
    (ProductData, $$ProductTableReferences),
    ProductData,
    PrefetchHooks Function({bool categoryId, bool transactionItemRefs})>;
typedef $$TransactionItemTableCreateCompanionBuilder = TransactionItemCompanion
    Function({
  Value<String> id,
  Value<String?> productId,
  Value<String?> transactionId,
  Value<int> qty,
  Value<double> price,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$TransactionItemTableUpdateCompanionBuilder = TransactionItemCompanion
    Function({
  Value<String> id,
  Value<String?> productId,
  Value<String?> transactionId,
  Value<int> qty,
  Value<double> price,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

final class $$TransactionItemTableReferences extends BaseReferences<_$DbService,
    $TransactionItemTable, TransactionItemData> {
  $$TransactionItemTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ProductTable _productIdTable(_$DbService db) =>
      db.product.createAlias(
          $_aliasNameGenerator(db.transactionItem.productId, db.product.id));

  $$ProductTableProcessedTableManager? get productId {
    final $_column = $_itemColumn<String>('product_id');
    if ($_column == null) return null;
    final manager = $$ProductTableTableManager($_db, $_db.product)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TransactionsTable _transactionIdTable(_$DbService db) =>
      db.transactions.createAlias($_aliasNameGenerator(
          db.transactionItem.transactionId, db.transactions.id));

  $$TransactionsTableProcessedTableManager? get transactionId {
    final $_column = $_itemColumn<String>('transaction_id');
    if ($_column == null) return null;
    final manager = $$TransactionsTableTableManager($_db, $_db.transactions)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_transactionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TransactionItemTableFilterComposer
    extends Composer<_$DbService, $TransactionItemTable> {
  $$TransactionItemTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get qty => $composableBuilder(
      column: $table.qty, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$ProductTableFilterComposer get productId {
    final $$ProductTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.product,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductTableFilterComposer(
              $db: $db,
              $table: $db.product,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TransactionsTableFilterComposer get transactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.transactionId,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableFilterComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TransactionItemTableOrderingComposer
    extends Composer<_$DbService, $TransactionItemTable> {
  $$TransactionItemTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get qty => $composableBuilder(
      column: $table.qty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$ProductTableOrderingComposer get productId {
    final $$ProductTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.product,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductTableOrderingComposer(
              $db: $db,
              $table: $db.product,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TransactionsTableOrderingComposer get transactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.transactionId,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableOrderingComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TransactionItemTableAnnotationComposer
    extends Composer<_$DbService, $TransactionItemTable> {
  $$TransactionItemTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get qty =>
      $composableBuilder(column: $table.qty, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$ProductTableAnnotationComposer get productId {
    final $$ProductTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.product,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductTableAnnotationComposer(
              $db: $db,
              $table: $db.product,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TransactionsTableAnnotationComposer get transactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.transactionId,
        referencedTable: $db.transactions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransactionsTableAnnotationComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TransactionItemTableTableManager extends RootTableManager<
    _$DbService,
    $TransactionItemTable,
    TransactionItemData,
    $$TransactionItemTableFilterComposer,
    $$TransactionItemTableOrderingComposer,
    $$TransactionItemTableAnnotationComposer,
    $$TransactionItemTableCreateCompanionBuilder,
    $$TransactionItemTableUpdateCompanionBuilder,
    (TransactionItemData, $$TransactionItemTableReferences),
    TransactionItemData,
    PrefetchHooks Function({bool productId, bool transactionId})> {
  $$TransactionItemTableTableManager(
      _$DbService db, $TransactionItemTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionItemTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionItemTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionItemTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> productId = const Value.absent(),
            Value<String?> transactionId = const Value.absent(),
            Value<int> qty = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TransactionItemCompanion(
            id: id,
            productId: productId,
            transactionId: transactionId,
            qty: qty,
            price: price,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> productId = const Value.absent(),
            Value<String?> transactionId = const Value.absent(),
            Value<int> qty = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TransactionItemCompanion.insert(
            id: id,
            productId: productId,
            transactionId: transactionId,
            qty: qty,
            price: price,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TransactionItemTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({productId = false, transactionId = false}) {
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
                if (productId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productId,
                    referencedTable:
                        $$TransactionItemTableReferences._productIdTable(db),
                    referencedColumn:
                        $$TransactionItemTableReferences._productIdTable(db).id,
                  ) as T;
                }
                if (transactionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.transactionId,
                    referencedTable: $$TransactionItemTableReferences
                        ._transactionIdTable(db),
                    referencedColumn: $$TransactionItemTableReferences
                        ._transactionIdTable(db)
                        .id,
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

typedef $$TransactionItemTableProcessedTableManager = ProcessedTableManager<
    _$DbService,
    $TransactionItemTable,
    TransactionItemData,
    $$TransactionItemTableFilterComposer,
    $$TransactionItemTableOrderingComposer,
    $$TransactionItemTableAnnotationComposer,
    $$TransactionItemTableCreateCompanionBuilder,
    $$TransactionItemTableUpdateCompanionBuilder,
    (TransactionItemData, $$TransactionItemTableReferences),
    TransactionItemData,
    PrefetchHooks Function({bool productId, bool transactionId})>;

class $DbServiceManager {
  final _$DbService _db;
  $DbServiceManager(this._db);
  $$CategoryTableTableManager get category =>
      $$CategoryTableTableManager(_db, _db.category);
  $$PaymentTableTableManager get payment =>
      $$PaymentTableTableManager(_db, _db.payment);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
  $$ProductTableTableManager get product =>
      $$ProductTableTableManager(_db, _db.product);
  $$TransactionItemTableTableManager get transactionItem =>
      $$TransactionItemTableTableManager(_db, _db.transactionItem);
}
