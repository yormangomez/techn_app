import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:techn_app/core/errors/exceptions.dart';
import 'package:techn_app/features/repair/data/datasource/repair_datasource.dart';
import 'package:techn_app/features/repair/data/model/repair_model.dart';

class RepairDatasourceImpl extends RepairDatasource {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  RepairDatasourceImpl();

  @override
  Future<bool> postRepair(RepairModel repairModel) async {
    try {
      final docUser = firestore.collection('repair').doc();
      await docUser.set(repairModel.toJson());
      return true;
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }
}
