import 'package:flutter/material.dart';
import 'package:note_app/models/note.dart';
import 'package:provider/provider.dart';
import 'package:note_app/models/notes_operation.dart';

class Home extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[300],
      appBar: AppBar(
        title: Text('My Note App'),
        backgroundColor: Colors.blue[500],
        centerTitle: true,
        elevation: 0.0,
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, '/add');
          },
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.add),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<NoteOperation>(
          builder: (context, NoteOperation data, child)  {
            return   ListView.builder(
              itemCount: data.getNotes.length,
                itemBuilder: (context, index){
                return NoteCard(data.getNotes[index],index);
                },
            );


          },


        ),
      ),
    );

  }
}

class NoteCard extends StatelessWidget {

  final Note note;

  NoteCard(this.note, this.index);

  int index;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
              note.title,
          style: TextStyle(

              fontSize: 20,
              fontWeight: FontWeight.bold,),
          ),

          SizedBox(
            height: 10,
          ),

          Text(note.description,
            style: TextStyle(

              fontSize: 20,
              fontWeight: FontWeight.normal,),
          ),


          Center(
            child: IconButton(
                icon: Icon(
                    Icons.delete),
                onPressed: () {
                  Provider.of<NoteOperation>(context, listen: false).removeNotes(
                      index);
                }),
          )
        ],
      ),

    );
  }
}