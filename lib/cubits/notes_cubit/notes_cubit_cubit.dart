import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/models/notes_model.dart';

import '../../constants.dart';

part 'notes_cubit_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  NotesCubitCubit() : super(NotesCubitInitial());
  
  List<NoteModel> notes = [];
  List<double> offsets = []; // Holds the offsets for each item
  fetchAllNotes()  {
   

     var notesBox = Hive.box<NoteModel>(KNotesBox);

      notes = notesBox.values.toList();
      offsets = List.filled(notes.length, 0.0);
      emit(NotesCubitLoaded());

    
  }
}
