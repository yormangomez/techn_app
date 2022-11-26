part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final String? message;
  final dynamic user;

  const HomeState({
    this.message,
    this.user,
  });

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial() : super();
}

class HomeCodeErrorState extends HomeState {
  final String? newMessage;

  const HomeCodeErrorState({this.newMessage}) : super(message: newMessage);
  @override
  List<Object?> get props => [];
}

class UserState extends HomeState {
  final dynamic newUser;

  const UserState({this.newUser}) : super(user: newUser);
  @override
  List<Object?> get props => [];
}
