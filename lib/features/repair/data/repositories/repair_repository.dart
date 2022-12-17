import 'package:dartz/dartz.dart';
import 'package:techn_app/core/errors/exceptions.dart';
import 'package:techn_app/core/errors/failure.dart';
import 'package:techn_app/features/repair/data/datasource/repair_datasource.dart';
import 'package:techn_app/features/repair/data/model/repair_model.dart';

abstract class RepairRepository {
  Future<Either<Failure, bool>> postRepair(RepairModel repairModel);
}

class RepairRepositoryImpl extends RepairRepository {
  final RepairDatasource repairDatasource;

  RepairRepositoryImpl({required this.repairDatasource});

  @override
  Future<Either<Failure, bool>> postRepair(RepairModel repairModel) async {
    try {
      final repair = await repairDatasource.postRepair(repairModel);

      return Right(repair);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(e.msg));
    }
  }
}
