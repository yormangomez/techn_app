import 'package:dartz/dartz.dart';
import 'package:techn_app/core/errors/failure.dart';
import 'package:techn_app/core/usecases/use_cases.dart';
import 'package:techn_app/features/onbording/data/repositories/user_firebase_repository.dart';

class UserFirebaseParams {
  final String idUser;
  UserFirebaseParams({required this.idUser});
}

class UserFirebaseUseCases extends UseCase<dynamic, UserFirebaseParams> {
  final UserFirebaseRepository repository;
  UserFirebaseUseCases({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(UserFirebaseParams params) async {
    return await repository.getUser(params.idUser);
  }
}
