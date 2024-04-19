part of 'delete_cubit.dart';

abstract class DeleteState {}

class DeleteInitial extends DeleteState {}

class DeleteSuccess extends DeleteState {
  final int index;

  DeleteSuccess(this.index);
}
