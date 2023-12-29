import 'package:firebase_remote_config/firebase_remote_config.dart';

void setupFirebaseRemoteConfig() async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(hours: 1),
  ));

  await remoteConfig.setDefaults(const {
    "calendar_ebook_data": "{\"title\":\"Kalender 2024\",\"pdfUrl\":\"https://is3.cloudhost.id/ekayana-prod/ebook/book_22e61004-724a-443b-b119-0fcc556a1a7e.pdf\"}",
  });

  await remoteConfig.fetchAndActivate();
}
