import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techn_app/features/repair/data/model/repair_model.dart';
import 'package:techn_app/features/repair/domain/usecases/repair_usecases.dart';

part 'repair_event.dart';
part 'repair_state.dart';

class RepairBloc extends Bloc<RepairEvent, RepairState> {
  final RepairUseCases repairUseCases;
  RepairBloc({required this.repairUseCases}) : super(RepairInitial()) {
    on<RepairEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AddRepairEvent>((event, emit) async {
      await repairUseCases.repository.postRepair(event.repair!);
    });
  }
}
