import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:note_app/models/notes_operation.dart';

class Add extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String titleText;
    String descriptionText;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My Note App'),
        backgroundColor: Colors.blue[900],
      ),

      body: Padding(
          padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Enter Title",
                hintStyle: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onChanged: (value) {
                titleText = value;
              },
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Enter Description",
                    hintStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    )
                ),
                onChanged: (value) {
                  descriptionText = value;
                },
              ),
            ),

            FlatButton(
              color: Colors.blueAccent,
              child: Text(
                  "Add Note",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white

              ),
              ),
              onPressed: () {
                Provider.of<NoteOperation>(context, listen: false).addNewNote(titleText, descriptionText);
                Navigator.pop(context);
              },
            ),
            
          ],


        ),
      )

    );
  }
}
