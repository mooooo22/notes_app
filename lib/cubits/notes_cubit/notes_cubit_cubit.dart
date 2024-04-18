import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/models/notes_model.dart';

import '../../constants.dart';

part 'notes_cubit_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  NotesCubitCubit() : super(NotesCubitInitial());
  fetchAllNotes() async {
    emit(NotesCubitLoading());
    try {
     var notesBox = Hive.box<NoteModel>(KNotesBox);

      emit(NotesCubitLoaded(notesBox.values.toList()));
    } catch (e) {
      
      emit(NotesCubitError(e.toString()));
    }
  }
}
