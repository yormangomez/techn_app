part of 'technical_bloc.dart';

abstract class TechnicalState extends Equatable {
  const TechnicalState();
  
  @override
  List<Object> get props => [];
}

class TechnicalInitial extends TechnicalState {}
