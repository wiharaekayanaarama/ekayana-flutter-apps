import 'package:ekayanaarama/src/data/entity/base_response.dart';
import 'package:ekayanaarama/src/data/entity/ebook_entity.dart';
import 'package:ekayanaarama/src/data/entity/todo_entity.dart';
import 'package:ekayanaarama/src/data/providers/base_provider.dart';
import 'package:get/get.dart';

class EbookApiProvider extends BaseProvider {
  Future<Response<BaseResponse<List<EbookEntity>>>> getEbooks() => get(
      '/ebook',
    decoder: (json) => BaseResponse.fromJson(json),
  );
}