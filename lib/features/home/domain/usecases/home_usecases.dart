import 'package:dartz/dartz.dart';
import 'package:techn_app/core/errors/failure.dart';
import 'package:techn_app/core/usecases/use_cases.dart';
import 'package:techn_app/features/home/data/repository/home_repository.dart';

class HomeParams {
  HomeParams();
}

class HomeUseCases extends UseCase<dynamic, HomeParams> {
  final HomeDataRepository repository;
  HomeUseCases({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(HomeParams params) async {
    return await repository.postUser();
  }
}
