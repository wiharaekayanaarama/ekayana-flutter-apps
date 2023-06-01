import 'package:ekayanaarama/src/data/entity/event_entity.dart';

abstract class EventRepository {
  Future<List<EventEntity>> getEvents();
  Future<List<EventEntity>> getPastEvents();
  Future<EventEntity> getEventById(int id);
}