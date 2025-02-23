import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_bloc/todo_cubit/to_do_cubit.dart';

class ListPage extends StatelessWidget {
  ListPage({super.key});
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Add List'),
        backgroundColor: Colors.blue.shade100,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'save your work... write here!'
                ),
              ),
              const SizedBox(height: 10.0),
              FilledButton.icon(onPressed: () {
                context.read<ToDoCubit>().toDo_add(_controller.text.trim());
                Navigator.pop(context);
              }, 
              label: Text('Add',),
              ),
            ],
          ),
        ),
      );
  }
  
}