import 'package:toktik/domain/entities/video_post.dart';

class VideoPostModel {
  final String caption;
  final String videoUrl;
  final int likes;
  final int views;
  VideoPostModel(
      {required this.caption,
      required this.videoUrl,
      this.likes = 0,
      this.views = 0});
  factory VideoPostModel.fromJsonMap(Map<String, dynamic> json) =>
      VideoPostModel(
          caption: json['name'] ?? 'no video',
          videoUrl: json['videoUrl'],
          likes: json['likes'] ?? 0,
          views: json['views'] ?? 0);
  Map<String, dynamic> toJson() => {
        "caption": caption,
        "videoUrl": videoUrl,
        "likes": likes,
        "views": views,
      };
  VideoPost toVideoPost() => VideoPost(
      caption: caption, videoUrl: videoUrl, likes: likes, views: views);
}
