import 'package:ekayanaarama/src/data/entity/ebook_entity.dart';

abstract class EbookRepository {
  Future<List<EbookEntity>> getEbooks();
}