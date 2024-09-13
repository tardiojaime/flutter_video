import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollView extends StatelessWidget {
  final List<VideoPost> videos;
  const VideoScrollView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      // animacion tipo rebote
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (BuildContext context, int index) {
        final VideoPost videoPost = videos[index];
        return Stack(
          children: [
            //video player + gradiente
            SizedBox.expand(
                child: FullscreenPlayer(
                    videoUrl: videoPost.videoUrl, caption: videoPost.caption)),
            //botton
            Positioned(
                bottom: 40, right: 20, child: VideoButtons(video: videoPost)),
          ],
        );
      },
    );
  }
}
