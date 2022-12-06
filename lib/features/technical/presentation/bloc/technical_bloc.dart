import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'technical_event.dart';
part 'technical_state.dart';

class TechnicalBloc extends Bloc<TechnicalEvent, TechnicalState> {
  TechnicalBloc() : super(TechnicalInitial()) {
    on<TechnicalEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
