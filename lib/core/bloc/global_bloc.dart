import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techn_app/core/models/user_model.dart';
import 'package:techn_app/features/onbording/domain/usecases/user_firebase_usecases.dart';

part 'global_event.dart';
part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  final UserFirebaseUseCases userFirebaseUseCases;
  GlobalBloc({required this.userFirebaseUseCases}) : super(GlobalInitial()) {
    on<UserEvent>((event, emit) async {
      final resultDb =
          await userFirebaseUseCases.repository.getUser(event.idUser);

      resultDb.fold((dynamic failure) {
        String message = failure.message;
        emit(GlobalCodeErrorState(newMessage: message));
      }, (UserModel user) {
        emit(UserState(newUser: user));
      });
    });
  }
}
