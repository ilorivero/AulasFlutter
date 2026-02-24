import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

/// Tela do player de áudio com controles de play, pausa, parar e volume.
///
/// Usa [AudioPlayer] do pacote audioplayers para tocar um arquivo
/// de música local ([AssetSource]), com um [Slider] para controle de volume
/// e botões de controle representados por imagens.
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /// Instância do player de áudio.
  final AudioPlayer _audioPlayer = AudioPlayer();

  /// Indica se é a primeira execução (evita reiniciar do zero no resume).
  bool _primeiraExecucao = true;

  /// Volume atual do player (0.0 a 1.0).
  double _volume = 0.5;

  /// Inicia ou retoma a reprodução da música.
  ///
  /// Na primeira chamada, inicia a reprodução do arquivo de asset.
  /// Nas chamadas seguintes, retoma a partir do ponto pausado.
  _executar() async {
    await _audioPlayer.setVolume(_volume);
    if (_primeiraExecucao) {
      await _audioPlayer.play(AssetSource('audios/musica.mp3'));
      setState(() {
        _primeiraExecucao = false;
      });
    } else {
      await _audioPlayer.resume();
    }
  }

  /// Pausa a reprodução atual.
  _pausar() async {
    await _audioPlayer.pause();
  }

  /// Para a reprodução e reinicia ao início.
  _parar() async {
    await _audioPlayer.stop();
    setState(() {
      _primeiraExecucao = true;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sons Player")),
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(8)),
          // Slider de controle de volume.
          Slider(
            value: _volume,
            min: 0,
            max: 1,
            divisions: 10,
            label: "${(_volume * 100).toInt()}%",
            onChanged: (novoVolume) {
              setState(() {
                _volume = novoVolume;
              });
              _audioPlayer.setVolume(novoVolume);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/images/executar.png"),
                  onTap: () {
                    _executar();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/images/pausar.png"),
                  onTap: () {
                    _pausar();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/images/parar.png"),
                  onTap: () {
                    _parar();
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
