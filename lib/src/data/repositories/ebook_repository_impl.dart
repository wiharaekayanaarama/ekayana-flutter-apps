import 'package:ekayanaarama/src/data/entity/ebook_entity.dart';
import 'package:ekayanaarama/src/data/providers/ebook_api_provider.dart';
import 'package:ekayanaarama/src/domain/repositories/ebook_repository.dart';

class EbookRepositoryImpl implements EbookRepository {
  final EbookApiProvider provider;

  const EbookRepositoryImpl({
    required this.provider,
  });

  @override
  Future<List<EbookEntity>> getEbooks() async {
    final ebooks = await provider.getEbooks();
    if (ebooks.status.hasError) {
      return Future.error(ebooks.statusText ?? "");
    }
    return (ebooks.body?.data as List<dynamic>)
        .map<EbookEntity>((item) => EbookEntity.fromJson(item))
        .toList();
  }
}
