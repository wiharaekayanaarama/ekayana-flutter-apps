import 'package:ekayanaarama/src/data/entity/base_response.dart';
import 'package:ekayanaarama/src/data/entity/ebook_entity.dart';
import 'package:ekayanaarama/src/data/entity/event_entity.dart';
import 'package:ekayanaarama/src/data/providers/base_provider.dart';
import 'package:get/get.dart';

class ApiProvider extends BaseProvider {
  Future<Response<BaseResponse<List<EbookEntity>>>> getEbooks() => get(
      '/ebook',
    decoder: (json) => BaseResponse.fromJson(json),
  );

  Future<Response<BaseResponse<List<EventEntity>>>> getEvents() => get(
    '/event',
    decoder: (json) => BaseResponse.fromJson(json),
  );

  Future<Response<BaseResponse<List<EventEntity>>>> getPastEvents() => get(
    '/event?type=PAST',
    decoder: (json) => BaseResponse.fromJson(json),
  );

  Future<Response<BaseResponse<EventEntity>>> getEventById(int id) => get(
    '/event/$id',
    decoder: (json) => BaseResponse.fromJson(json),
  );
}