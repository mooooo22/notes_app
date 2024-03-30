part of 'add_note_cubit.dart';

sealed class AddNotesState {
  const AddNotesState();
}

final class NotesInitial extends AddNotesState {}

final class NotesLoading extends AddNotesState {}

final class NotesSuccess extends AddNotesState {}

final class NotesFaliure extends AddNotesState {
  final String message;
  NotesFaliure(this.message);
}
