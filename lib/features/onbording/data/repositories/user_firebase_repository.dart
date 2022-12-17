import 'package:dartz/dartz.dart';
import 'package:techn_app/core/errors/exceptions.dart';
import 'package:techn_app/core/errors/failure.dart';
import 'package:techn_app/core/models/user_model.dart';
import 'package:techn_app/features/onbording/data/datasources/user_firebase_datasource.dart';

abstract class UserFirebaseRepository {
  Future<Either<Failure, UserModel>> getUser(String idUser);
}

class UserFirebaseRepositoryImpl extends UserFirebaseRepository {
  final UserFirebaseDataSource userFirebaseSources;

  UserFirebaseRepositoryImpl({required this.userFirebaseSources});

  @override
  Future<Either<Failure, UserModel>> getUser(String idUser) async {
    try {
      final userModel = await userFirebaseSources.getUser(idUser);

      return Right(userModel);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(e.msg));
    }
  }
}
