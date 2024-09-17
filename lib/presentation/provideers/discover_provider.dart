import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infraestructure/repositories/video_posts_repository_impl.dart';

class DiscoverProvider extends ChangeNotifier {
  bool intialLoading = true;
  List<VideoPost> videos = [];
  final VideoPostsRepositoryImple videoRepository;
  DiscoverProvider({required this.videoRepository});
  Future<void> loadNextPage() async {
    // todo: cargar videos
    final newVideos = await videoRepository.getTrendinVideosByPage(1);
    videos.addAll(newVideos);
    intialLoading = false;
    notifyListeners();
  }
}
