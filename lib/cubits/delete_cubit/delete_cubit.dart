import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:notes_app/models/notes_model.dart';

part 'delete_state.dart';

class DeleteCubit extends Cubit<DeleteState> {
  DeleteCubit() : super(DeleteInitial());

  deleteNote(NoteModel note , int index) {
    note.delete();
    // delete note
    log('Note deleted successfully', name: 'DeleteCubit');
    emit(DeleteSuccess( index));
  }
}
