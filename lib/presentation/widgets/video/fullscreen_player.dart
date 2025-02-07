import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/video/video_backgroud.dart';
import 'package:video_player/video_player.dart';

class FullscreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;
  const FullscreenPlayer(
      {super.key, required this.videoUrl, required this.caption});

  @override
  State<FullscreenPlayer> createState() => _FullscreenPlayerState();
}

class _FullscreenPlayerState extends State<FullscreenPlayer> {
  late VideoPlayerController controller;
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true) // si termina que empieze de nuevo
      ..play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose(); // Libera los recursos cuando el widget se elimine
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        }
        // GestureDetector - detecta cualquier gestos del
        return GestureDetector(
          onTap: () {
            if (controller.value.isPlaying) {
              controller.pause();
              return;
            }
            controller.play();
          },
          // reproducir el video AspectRatio
          child: AspectRatio(
            // es útil para mantener una relación de aspecto específica en sus hijos
            aspectRatio: controller.value.aspectRatio,
            //Stack permite colocar widgets unos sobre otros.
            child: Stack(children: [
              VideoPlayer(controller),
              //Gradiente
              VideoBackgroud(stops: const [0.8, 1.0]),
              //texto
              Positioned(
                  bottom: 50,
                  left: 20,
                  child: _VideoCaption(caption: widget.caption))
            ]),
          ),
        );
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;
  const _VideoCaption({
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: size.width * 0.6,
      child: Text(caption, maxLines: 2, style: titleStyle),
    );
  }
}
