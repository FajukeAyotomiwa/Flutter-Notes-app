import 'package:note_app/models/note.dart';
import 'package:flutter/cupertino.dart';


class NoteOperation extends  ChangeNotifier {

  List<Note> _notes = new List<Note>();

  List<Note> get getNotes {
    return _notes;
  }

  NoteOperation(){
    addNewNote('Add Title', 'Add description');
  }

  void addNewNote(String title, String description) {
    Note note = Note(title, description);
    _notes.add(note);
    notifyListeners();
  }

  void removeNotes(int index){
    _notes.removeAt(index);
    notifyListeners();
  }

}