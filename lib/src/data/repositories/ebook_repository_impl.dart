import 'package:ekayanaarama/src/data/entity/ebook_entity.dart';
import 'package:ekayanaarama/src/data/providers/api_provider.dart';
import 'package:ekayanaarama/src/domain/repositories/ebook_repository.dart';

class EbookRepositoryImpl implements EbookRepository {
  final ApiProvider provider;

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

  @override
  Future<bool> incrementEbookView(int id) async {
    final result = await provider.postIncrementEbook(id);
    if (result.status.hasError) {
      return Future.error(result.statusText ?? "");
    }
    return Future.value(result.body?.data as bool);
  }
}
