import 'package:toktik/domain/datasources/video_post_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';

class VideoPostsRepositoryImple implements VideoPostRepository {
  // la fuente de datos, una que tenga la estructura de la clase abstracta.
  // que en este caso solo tenemos una creada en:
  // infraestructura/datasources/local_video_datasaurce_imple.dart -> LocalVideoDatasourceImpl
  final VideoPostDatasource videosDatasource;
  // no importa si mandamos otra distinta a la anterior siempre y cuando sea de tipo VideoPostDatasource
  VideoPostsRepositoryImple({required this.videosDatasource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendinVideosByPage(int page) {
    return videosDatasource.getTrendinVideosByPage(page);
  }
}
