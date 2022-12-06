import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techn_app/features/login/domain/usecases/login_usecases.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCases loginUseCases;

  LoginBloc({required this.loginUseCases}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoginPageEvent>((event, emit) async {
      final resultDB = await loginUseCases.repository.auth('', '');
    });
  }
}
