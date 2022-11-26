import 'package:dartz/dartz.dart';
import 'package:techn_app/core/errors/failure.dart';
import 'package:techn_app/core/usecases/use_cases.dart';
import 'package:techn_app/features/login/data/repository/login_repository.dart';

class AuthParams {
  final String user;
  final String password;

  AuthParams(
    this.user,
    this.password,
  );
}

class LoginUseCases extends UseCase<dynamic, AuthParams> {
  final LoginDataRepository repository;
  LoginUseCases({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(AuthParams params) async {
    return await repository.auth(params.user, params.password);
  }
}
