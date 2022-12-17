import 'package:dartz/dartz.dart';
import 'package:techn_app/core/errors/failure.dart';
import 'package:techn_app/core/usecases/use_cases.dart';
import 'package:techn_app/features/repair/data/model/repair_model.dart';
import 'package:techn_app/features/repair/data/repositories/repair_repository.dart';

class RepairParams {
  final RepairModel repair;

  RepairParams(this.repair);
}

class RepairUseCases extends UseCase<dynamic, RepairParams> {
  final RepairRepository repository;
  RepairUseCases({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(RepairParams params) async {
    return await repository.postRepair(params.repair);
  }
}
