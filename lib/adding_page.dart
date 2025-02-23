import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
                setNote();
                Navigator.pop(context);
              }, 
              label: Text('Add',),
              ),
            ],
          ),
        ),
      );
  }
  final note = Supabase.instance.client;
  void setNote() async{
    // ignore: unused_local_variable
    final sdata = await note.from('To_Do_List').insert({'detail': _controller.text});
  }
}