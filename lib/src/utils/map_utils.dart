import 'package:ekayanaarama/src/utils/launch_utils.dart';

enum Kind { url, coordinate }

class MapUtils {
  final String url;
  final double lat;
  final double lng;
  final Kind kind;

  const MapUtils.url({
    required this.url,
  })  : lat = 0.0,
        lng = 0.0,
        kind = Kind.url;

  const MapUtils.coordinate({
    required this.lat,
    required this.lng,
  })  : url = "",
        kind = Kind.coordinate;

  void launch() async {
    String url;
    if (kind == Kind.url) {
      url = this.url;
    } else {
      url = "https://www.google.com/maps/search/?api=1&query=$lat,$lng";
    }
    LaunchUtils.launch(url: url);
  }
}
