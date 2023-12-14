import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class OfficeMainNamesRecord extends FirestoreRecord {
  OfficeMainNamesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "person_name" field.
  String? _personName;
  String get personName => _personName ?? '';
  bool hasPersonName() => _personName != null;

  void _initializeFields() {
    _personName = snapshotData['person_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('office_main_names');

  static Stream<OfficeMainNamesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OfficeMainNamesRecord.fromSnapshot(s));

  static Future<OfficeMainNamesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OfficeMainNamesRecord.fromSnapshot(s));

  static OfficeMainNamesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OfficeMainNamesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OfficeMainNamesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OfficeMainNamesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OfficeMainNamesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OfficeMainNamesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOfficeMainNamesRecordData({
  String? personName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'person_name': personName,
    }.withoutNulls,
  );

  return firestoreData;
}

class OfficeMainNamesRecordDocumentEquality
    implements Equality<OfficeMainNamesRecord> {
  const OfficeMainNamesRecordDocumentEquality();

  @override
  bool equals(OfficeMainNamesRecord? e1, OfficeMainNamesRecord? e2) {
    return e1?.personName == e2?.personName;
  }

  @override
  int hash(OfficeMainNamesRecord? e) =>
      const ListEquality().hash([e?.personName]);

  @override
  bool isValidKey(Object? o) => o is OfficeMainNamesRecord;
}
