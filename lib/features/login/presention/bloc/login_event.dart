part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginPageEvent extends LoginEvent {
  const LoginPageEvent();
  @override
  List<Object?> get props => [];
}
