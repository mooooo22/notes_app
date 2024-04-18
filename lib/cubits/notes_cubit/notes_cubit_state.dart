part of 'notes_cubit_cubit.dart';

abstract class NotesCubitState  {
}

class NotesCubitInitial extends NotesCubitState {}
class NotesCubitLoading extends NotesCubitState {}
class NotesCubitLoaded extends NotesCubitState {
  final List<NoteModel> notes;
  NotesCubitLoaded(this.notes);
}
class NotesCubitError extends NotesCubitState {
  final String message;
  NotesCubitError(this.message);
}
