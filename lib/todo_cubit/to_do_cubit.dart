
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_bloc/models/to_do_sto.dart';

class ToDoCubit extends Cubit<List<ToDo_Sto>>{
  ToDoCubit() : super([]);

  // ignore: non_constant_identifier_names
  void toDo_add(String title){ 
    if(title.isEmpty){
      addError('It is empty');
      return;
    }  
    final toadd = ToDo_Sto(
      notes: title, val: DateTime.now()
      );
    state.add(toadd);
    emit([...state]);
  } 
  @override
  void onChange(Change<List<ToDo_Sto>> change) {
    super.onChange(change);
    print('ToDoCubit - $change');
  }
  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print('ToDoCubit - $error');
  }
}
