import 'package:dartz/dartz.dart';
import 'package:techn_app/core/errors/exceptions.dart';
import 'package:techn_app/core/errors/failure.dart';
import 'package:techn_app/features/login/data/datasources/login_datasources.dart';

abstract class LoginDataRepository {
  Future<Either<Failure, dynamic>> auth(String user, String password);
}

class LoginDataRepositoryImpl extends LoginDataRepository {
  final LoginDataSources loginDataSources;

  LoginDataRepositoryImpl({required this.loginDataSources});

  @override
  Future<Either<Failure, dynamic>> auth(String user, String password) async {
    try {
      final loginModel = await loginDataSources.auth(user, password);

      return Right(loginModel);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(e.msg));
    }
  }
}
