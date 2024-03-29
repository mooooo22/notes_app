import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_note_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
}
