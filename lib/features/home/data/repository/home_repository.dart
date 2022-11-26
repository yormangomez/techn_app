import 'package:dartz/dartz.dart';
import 'package:techn_app/core/errors/exceptions.dart';
import 'package:techn_app/core/errors/failure.dart';
import 'package:techn_app/features/home/data/datasources/home_datasources.dart';

abstract class HomeDataRepository {
  Future<Either<Failure, dynamic>> postUser();
}

class HomeDataRepositoryImpl extends HomeDataRepository {
  final HomeDataSources homeDataSources;

  HomeDataRepositoryImpl({required this.homeDataSources});

  @override
  Future<Either<Failure, dynamic>> postUser() async {
    try {
      final homeModel = await homeDataSources.postUser();

      return Right(homeModel);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(e.msg));
    }
  }
}
