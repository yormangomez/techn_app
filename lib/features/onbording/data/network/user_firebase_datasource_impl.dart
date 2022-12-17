import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:techn_app/core/errors/exceptions.dart';
import 'package:techn_app/core/models/user_model.dart';
import 'package:techn_app/features/onbording/data/datasources/user_firebase_datasource.dart';

class UserFirebaseDataSourceImpl extends UserFirebaseDataSource {
  final FirebaseFirestore firebase = FirebaseFirestore.instance;
  UserFirebaseDataSourceImpl();

  @override
  Future<UserModel> getUser(String idUser) async {
    try {
      final snapshot = await firebase.collection('user').doc(idUser).get();
      if (snapshot.exists) {
        final body = UserModel.fromJson(snapshot.data()!);
        return body;
      } else {
        throw GeneralException("Ocurrió un error general");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }
}
