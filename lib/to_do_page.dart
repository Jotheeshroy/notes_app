import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supb = Supabase.instance.client;

class ToDoPage extends StatelessWidget {
  ToDoPage({super.key});
  final gData = supb.from('To_Do_List').stream(primaryKey: ['id']);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        backgroundColor: Colors.cyanAccent.shade200,
        centerTitle: true,
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: gData, 
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator()
            );
          }  
          final data = snapshot.data;
          return ListView.builder(
            itemCount: data?.length,
            itemBuilder: (context, index) {
              final note = data?[index];
              final todonote = note?['detail'];
              return Text(todonote);
            },
          );
        },
        ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(onPressed: () {
            Navigator.pushNamed(context, '/add_list');
          },
          tooltip: 'add_to-do',
          child: Icon(Icons.add_box_outlined),
          ),
        ],
      ),
    );
  }
  
}