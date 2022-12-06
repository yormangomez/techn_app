part of 'process_bloc.dart';

abstract class ProcessState extends Equatable {
  const ProcessState();
  
  @override
  List<Object> get props => [];
}

class ProcessInitial extends ProcessState {}
