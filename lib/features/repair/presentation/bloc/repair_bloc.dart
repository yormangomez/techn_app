import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'repair_event.dart';
part 'repair_state.dart';

class RepairBloc extends Bloc<RepairEvent, RepairState> {
  RepairBloc() : super(RepairInitial()) {
    on<RepairEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
