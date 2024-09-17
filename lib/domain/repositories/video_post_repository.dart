import 'package:toktik/domain/entities/video_post.dart';

abstract class VideoPostRepository {
  // reglas que tiene q se tiene que implementar
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId);
  // metodo que deven implementar las que utilizen esta clase
  Future<List<VideoPost>> getTrendinVideosByPage(int page);
}
