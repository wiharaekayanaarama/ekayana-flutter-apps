import 'package:ekayanaarama/src/data/entity/routine_activity_entity.dart';

abstract class RoutineActivityRepository {
  Future<List<RoutineActivityEntity>?> getRoutineActivities();
  Future<List<RoutineActivityEntity>?> getTodayActivities();
}