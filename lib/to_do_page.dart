import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_bloc/models/to_do_sto.dart';
import 'package:to_do_bloc/todo_cubit/to_do_cubit.dart';

class ToDoPage extends StatelessWidget {
   const ToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        backgroundColor: Colors.cyanAccent.shade200,
        centerTitle: true,
      ),
      body: BlocBuilder<ToDoCubit, List<ToDo_Sto>>(
        builder: (context, todos) {
        return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
          final todo = todos[index];
          return ListTile(
            title: Text(todo.notes),
          );
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