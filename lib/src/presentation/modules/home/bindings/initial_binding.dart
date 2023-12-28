import 'package:ekayanaarama/src/presentation/modules/event/bindings/incoming_events_binding.dart';
import 'package:ekayanaarama/src/presentation/modules/home/bindings/home_activity_binding.dart';
import 'package:get/get.dart';

class InitialHomeBinding extends Bindings {
  @override
  void dependencies() {
    HomeActivityBinding().dependencies();
    IncomingEventsBinding().dependencies();
  }
}