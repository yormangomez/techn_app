import 'package:techn_app/features/repair/data/model/repair_model.dart';

abstract class RepairDatasource {
  Future<bool> postRepair(RepairModel repairModel);
}
