import 'package:techn_app/core/models/user_model.dart';

abstract class UserFirebaseDataSource {
  Future<UserModel> getUser(String idUser);
}
