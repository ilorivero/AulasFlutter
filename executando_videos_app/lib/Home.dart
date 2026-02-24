import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// Tela principal do app de reprodução de vídeo.
///
/// Reproduz um vídeo local (assets/videos/exemplo.mp4) em loop,
/// usando [VideoPlayerController.asset] e exibindo com [AspectRatio].
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /// Controlador do vídeo. Inicializado com `late` (null safety).
  late VideoPlayerController _videocontroller;

  @override
  void initState() {
    super.initState();
    // Inicializa o controller com o vídeo de assets e inicia a reprodução.
    _videocontroller = VideoPlayerController.asset("assets/videos/exemplo.mp4")
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {
          _videocontroller.play();
        });
      });
  }

  @override
  void dispose() {
    // Libera os recursos do controlador ao destruir o widget.
    _videocontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // VideoPlayerInitialized garante que o widget só é exibido após inicialização.
        child: _videocontroller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _videocontroller.value.aspectRatio,
                child: VideoPlayer(_videocontroller),
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
