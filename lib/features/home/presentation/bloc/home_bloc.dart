import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:techn_app/features/home/domain/usecases/home_usecases.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCases homeUseCases;

  HomeBloc({required this.homeUseCases}) : super(const HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<UserPageEvent>((event, emit) async {
      FirebaseFirestore.instance
          .collection('user')
          .doc((FirebaseAuth.instance.currentUser!.displayName))
          .get()
          .then((value) => emit(UserNameState(newUserName: value.get('name'))));

      //final resultDb = await homeUseCases.repository.postUser();

      /* resultDb.fold((dynamic failure) {
        String message = failure.message;
        emit(HomeCodeErrorState(newMessage: message));
      }, (dynamic user) {});*/
    });
  }
}
