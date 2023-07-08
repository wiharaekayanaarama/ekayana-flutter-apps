import 'package:url_launcher/url_launcher.dart';

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
    Uri uri;
    if (kind == Kind.url) {
      uri = Uri.parse(url);
    } else {
      uri = Uri.parse(
        "https://www.google.com/maps/search/?api=1&query=$lat,$lng",
      );
    }
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }
}
