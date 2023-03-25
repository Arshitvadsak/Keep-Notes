import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:registration_login/view/style/app_style.dart';

class NoteAdditor extends StatefulWidget {
  const NoteAdditor({super.key});

  @override
  State<NoteAdditor> createState() => _NoteAdditorState();
}

class _NoteAdditorState extends State<NoteAdditor> {
  int color_id = Random().nextInt(AppStyle.cardsColor.length);
  String data = DateTime.now().toString().split(" ")[0];
  TextEditingController titleController = TextEditingController();
  TextEditingController mainController = TextEditingController();
  GlobalKey<FormState> Validator = GlobalKey<FormState>();
  String? title;
  String? cont;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0,
        title: Text('Add a new Note'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: Validator,
          child: Column(
            children: [
              TextFormField(
                onSaved: (val) {
                  setState(() {
                    title = val;
                  });
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'enter yout title';
                  }
                },
                controller: titleController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Note Title',
                ),
                style: AppStyle.mainTitle,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                data,
                style: AppStyle.DataTitle,
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: mainController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Note Contenet',
                ),
                style: AppStyle.mainContent,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (Validator.currentState!.validate()) {
            Validator.currentState!.save();
            FirebaseFirestore.instance.collection('notes').add({
              "notes_tital": titleController.text,
              "creation_date": data,
              "note_content": mainController.text,
              "color_id": color_id,
            }).then((value) {
              print(value.id);

              Navigator.pop(context);
            }).catchError(
                (error) => print("Faild to add new Note due to $error"));
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
