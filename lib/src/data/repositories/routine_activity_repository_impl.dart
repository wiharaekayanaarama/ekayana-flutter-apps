import 'package:ekayanaarama/src/data/entity/routine_activity_entity.dart';
import 'package:ekayanaarama/src/data/providers/api_provider.dart';
import 'package:ekayanaarama/src/domain/repositories/routine_activity_repository.dart';

class RoutineActivityRepositoryImpl implements RoutineActivityRepository {
  final ApiProvider provider;

  RoutineActivityRepositoryImpl({
    required this.provider,
  });

  @override
  Future<List<RoutineActivityEntity>?> getRoutineActivities() async {
    final routineActivities = await provider.getRoutineActivities();
    if (routineActivities.status.hasError) {
      return Future.error(routineActivities.statusText ?? "");
    }
    return Future.value((routineActivities.body?.data as List<dynamic>?)
        ?.map<RoutineActivityEntity>(
            (item) => RoutineActivityEntity.fromJson(item))
        .toList());
  }

  @override
  Future<List<RoutineActivityEntity>?> getTodayActivities() async {
    final routineActivities = await provider.getTodayActivities();
    if (routineActivities.status.hasError) {
      return Future.error(routineActivities.statusText ?? "");
    }
    return Future.value((routineActivities.body?.data as List<dynamic>?)
        ?.map<RoutineActivityEntity>(
          (item) => RoutineActivityEntity.fromJson(item),
        )
        .toList());
  }
}
