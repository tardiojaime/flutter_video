import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infraestructure/models/video_post_model.dart';
import 'package:toktik/shared/data/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  bool intialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    // todo: cargar videos
    final List<VideoPost> newVideos = videoPosts
        .map((video) => VideoPostModel.fromJsonMap(video).toVideoPost())
        .toList();
    videos.addAll(newVideos);
    intialLoading = false;
    notifyListeners();
  }
}
