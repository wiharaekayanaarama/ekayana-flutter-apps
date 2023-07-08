import 'package:url_launcher/url_launcher.dart';

class LaunchUtils {
  const LaunchUtils._();

  static void launch({
    required String url,
    LaunchMode mode = LaunchMode.externalApplication,
  }) async {
    await launchUrl(
      Uri.parse(url),
      mode: mode,
    );
  }
}
