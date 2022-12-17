part of 'global_bloc.dart';

abstract class GlobalState extends Equatable {
  final UserModel? user;
  final String? message;

  const GlobalState({this.user, this.message});

  @override
  List<Object?> get props => [];
}

class GlobalInitial extends GlobalState {}

class GlobalCodeErrorState extends GlobalState {
  final String? newMessage;

  const GlobalCodeErrorState({this.newMessage}) : super(message: newMessage);
  @override
  List<Object?> get props => [];
}

class UserState extends GlobalState {
  final UserModel? newUser;

  const UserState({this.newUser}) : super(user: newUser);
}
