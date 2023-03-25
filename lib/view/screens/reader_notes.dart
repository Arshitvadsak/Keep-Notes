import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:registration_login/helpers/forebase_db_helper.dart';
import 'package:registration_login/view/style/app_style.dart';

class AddNote extends StatefulWidget {
  AddNote(this.doc, {super.key});
  QueryDocumentSnapshot doc;

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  String data = DateTime.now().toString().split(" ")[0];
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    TextEditingController titleController =
        TextEditingController(text: widget.doc["notes_tital"]);
    TextEditingController mainController =
        TextEditingController(text: widget.doc['note_content']);
    GlobalKey<FormState> Validator = GlobalKey<FormState>();

    return Scaffold(
      //backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    contentPadding: EdgeInsets.all(10),
                    content: Column(
                      children: [
                        Text(
                          "Adit this Notes",
                          style: AppStyle.mainTitle,
                        ),
                        Expanded(
                          child: TextField(
                            autofocus: true,
                            autocorrect: true,
                            decoration: InputDecoration(
                                labelText: 'your Title',
                                labelStyle: AppStyle.mainContent),
                            controller: titleController,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            autofocus: true,
                            autocorrect: true,
                            decoration: InputDecoration(
                                labelText: 'your desc',
                                labelStyle: AppStyle.mainContent),
                            controller: mainController,
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      FloatingActionButton(
                        onPressed: () async {
                          await FirestoreDBHelper.firestoreDBHelper
                              .UpDate(id: widget.doc.id);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.save),
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.add)),
          IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc["notes_tital"],
              style: AppStyle.mainTitle,
            ),
            Text(
              widget.doc["creation_date"],
              style: AppStyle.DataTitle,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.doc["note_content"],
              style: AppStyle.mainContent,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
