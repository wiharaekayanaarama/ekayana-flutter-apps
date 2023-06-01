import 'package:ekayanaarama/ekayana.dart';

extension RoutineExt on String? {
  String get getActivityIcon {
    switch(this) {
      case "kebaktian": return Iconography.dhammachakkra;
      case "edukasi": return Iconography.lotus;
      case "meditasi": return Iconography.meditate;
      case "olahraga": return Iconography.sport;
      case "lainnya": return Iconography.giveLove;
      default: return Iconography.check;
    }
  }
}