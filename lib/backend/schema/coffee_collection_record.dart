import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CoffeeCollectionRecord extends FirestoreRecord {
  CoffeeCollectionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "coffee_choices" field.
  String? _coffeeChoices;
  String get coffeeChoices => _coffeeChoices ?? '';
  bool hasCoffeeChoices() => _coffeeChoices != null;

  void _initializeFields() {
    _coffeeChoices = snapshotData['coffee_choices'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('coffee_collection');

  static Stream<CoffeeCollectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoffeeCollectionRecord.fromSnapshot(s));

  static Future<CoffeeCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CoffeeCollectionRecord.fromSnapshot(s));

  static CoffeeCollectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CoffeeCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoffeeCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoffeeCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoffeeCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoffeeCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoffeeCollectionRecordData({
  String? coffeeChoices,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'coffee_choices': coffeeChoices,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoffeeCollectionRecordDocumentEquality
    implements Equality<CoffeeCollectionRecord> {
  const CoffeeCollectionRecordDocumentEquality();

  @override
  bool equals(CoffeeCollectionRecord? e1, CoffeeCollectionRecord? e2) {
    return e1?.coffeeChoices == e2?.coffeeChoices;
  }

  @override
  int hash(CoffeeCollectionRecord? e) =>
      const ListEquality().hash([e?.coffeeChoices]);

  @override
  bool isValidKey(Object? o) => o is CoffeeCollectionRecord;
}
