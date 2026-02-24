import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

/// Tela principal do app de sons dos animais.
///
/// Exibe três imagens de animais (cachorro, gato e vaca) que,
/// ao serem tocadas, reproduzem o som correspondente usando [AudioPlayer].
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /// Instância do player de áudio.
  final AudioPlayer _audioPlayer = AudioPlayer();

  /// Reproduz o som do cachorro a partir dos assets.
  _executarDog() async {
    await _audioPlayer.play(AssetSource('audios/dog.mp3'));
  }

  /// Reproduz o som do gato a partir dos assets.
  _executarCat() async {
    await _audioPlayer.play(AssetSource('audios/cat.mp3'));
  }

  /// Reproduz o som da vaca a partir dos assets.
  _executarCow() async {
    await _audioPlayer.play(AssetSource('audios/cow.mp3'));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sons dos Animais")),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/images/dog.png"),
                  onTap: () {
                    _executarDog();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/images/cat.png"),
                  onTap: () {
                    _executarCat();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/images/cow.png"),
                  onTap: () {
                    _executarCow();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
