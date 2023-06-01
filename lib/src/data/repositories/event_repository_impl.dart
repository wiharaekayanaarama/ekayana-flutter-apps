import 'package:ekayanaarama/src/data/entity/event_entity.dart';
import 'package:ekayanaarama/src/data/providers/api_provider.dart';
import 'package:ekayanaarama/src/domain/repositories/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  final ApiProvider provider;

  const EventRepositoryImpl({
    required this.provider,
  });

  @override
  Future<List<EventEntity>> getEvents() async {
    final events = await provider.getEvents();
    if (events.status.hasError) {
      return Future.error(events.statusText ?? "");
    }
    return (events.body?.data as List<dynamic>)
        .map<EventEntity>((item) => EventEntity.fromJson(item))
        .toList();
  }

  @override
  Future<List<EventEntity>> getPastEvents() async {
    final events = await provider.getPastEvents();
    if (events.status.hasError) {
      return Future.error(events.statusText ?? "");
    }
    return (events.body?.data as List<dynamic>)
        .map<EventEntity>((item) => EventEntity.fromJson(item))
        .toList();
  }

  @override
  Future<EventEntity> getEventById(int id) async {
    final events = await provider.getEventById(id);
    if (events.status.hasError) {
      return Future.error(events.statusText ?? "");
    }
    return EventEntity.fromJson(events.body?.data as Map<String, dynamic>);
  }

}