part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {}

class UserPageEvent extends HomeEvent {
  UserPageEvent();
  @override
  List<Object?> get props => [];
}
