import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "person_name" field.
  String? _personName;
  String get personName => _personName ?? '';
  bool hasPersonName() => _personName != null;

  // "coffee_choice" field.
  String? _coffeeChoice;
  String get coffeeChoice => _coffeeChoice ?? '';
  bool hasCoffeeChoice() => _coffeeChoice != null;

  // "order_date" field.
  DateTime? _orderDate;
  DateTime? get orderDate => _orderDate;
  bool hasOrderDate() => _orderDate != null;

  // "completed" field.
  bool? _completed;
  bool get completed => _completed ?? false;
  bool hasCompleted() => _completed != null;

  void _initializeFields() {
    _personName = snapshotData['person_name'] as String?;
    _coffeeChoice = snapshotData['coffee_choice'] as String?;
    _orderDate = snapshotData['order_date'] as DateTime?;
    _completed = snapshotData['completed'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  String? personName,
  String? coffeeChoice,
  DateTime? orderDate,
  bool? completed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'person_name': personName,
      'coffee_choice': coffeeChoice,
      'order_date': orderDate,
      'completed': completed,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    return e1?.personName == e2?.personName &&
        e1?.coffeeChoice == e2?.coffeeChoice &&
        e1?.orderDate == e2?.orderDate &&
        e1?.completed == e2?.completed;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality()
      .hash([e?.personName, e?.coffeeChoice, e?.orderDate, e?.completed]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
