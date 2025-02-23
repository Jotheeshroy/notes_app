import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do_bloc/adding_page.dart';
import 'package:to_do_bloc/to_do_page.dart';
import 'package:to_do_bloc/todo_cubit/to_do_cubit.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();

   await Supabase.initialize(
    url: "https://ylgrjuuwhehwixjcsxpx.supabase.co", 
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlsZ3JqdXV3aGVod2l4amNzeHB4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDAxMjkyNDUsImV4cCI6MjA1NTcwNTI0NX0.ks_LSb2xouWNQYPYXjWc3me9FCMYwSyfOrYi7qy-RM0",
    );
  runApp(const To_Do());
}

// ignore: camel_case_types
class To_Do extends StatelessWidget {
  const To_Do({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ToDoCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To_Do',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent.shade200),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) =>  ToDoPage(),
          '/add_list' : (context) => ListPage(),
        },
      ),
    );
  }
}