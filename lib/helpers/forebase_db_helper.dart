import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDBHelper {
  FirestoreDBHelper._();
  static final FirestoreDBHelper firestoreDBHelper = FirestoreDBHelper._();

  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> insert({required Map<String, dynamic> data}) async {
    // await db.collection('notes').add(data);
    DocumentSnapshot<Map<String, dynamic>> counter =
        await db.collection("counter").doc("notes_counter").get();

    int id = counter['id'];
    int length = counter['length'];

    await db.collection('notes').doc("${++id}").set(data);
    await db.collection("counter").doc("notes_counter").update({"id": id});

    await db.collection("notes").doc("notes_counter").update({"id": ++id});
  }

  Future<void> UpDate({required String id}) async {
    await db.collection('counter').doc().delete();

    DocumentSnapshot<Map<String, dynamic>> counter =
        await db.collection('counter').doc("notes_counter").get();

    int length = counter['length'];

    await db
        .collection('counter')
        .doc('notes_counter')
        .update({"length": ++length});

    DocumentSnapshot<Map<String, dynamic>> notes =
        await db.collection('notes').doc('j2RJKkFSBcPAoy9CUF3F').get();

    await db
        .collection('notes')
        .doc('gGDJOkhPEohjJG08tqoU')
        .update({"note_content": "💸........"});
  }
}
