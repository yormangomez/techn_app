part of 'repair_bloc.dart';

abstract class RepairEvent extends Equatable {
  const RepairEvent();

  @override
  List<Object> get props => [];
}

class AddRepairEvent extends RepairEvent {
  final RepairModel? repair;
  const AddRepairEvent({this.repair});
}
