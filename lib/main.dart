import 'package:flutter/material.dart';
import 'package:note_app/screens/add.dart';
import 'package:note_app/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:note_app/models/notes_operation.dart';

void main() =>
  runApp(ChangeNotifierProvider<NoteOperation>(
    create: (context)=>NoteOperation(),
    child: MaterialApp(

      routes: {
        '/add': (context)=> Add(),
      },
      home: Home(
      )
    ),
  )
  );


