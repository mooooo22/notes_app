import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/notes_model.dart';

part 'add_note_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(NotesInitial());
  addNote(NoteModel noteModel) async {
    emit(NotesLoading());
    try {
      // Add note to database
      var notesBox = Hive.box<NoteModel>(KNotesBox);
      await notesBox.add(noteModel);
      emit(NotesSuccess());
    } catch (e) {
      emit(NotesFaliure(e.toString()));
    }
  }
}
