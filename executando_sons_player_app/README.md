# executando_sons_player_app

Aplicativo Flutter com **player de áudio** completo: play, pausa, parar e controle de volume.

## 📖 Descrição

Demonstra controles mais avançados de áudio com o pacote `audioplayers`. O usuário pode iniciar, pausar e parar a reprodução de uma música local, além de ajustar o volume com um Slider.

## 🚀 Funcionalidades

- **Play**: inicia ou retoma a reprodução
- **Pausa**: pausa mantendo a posição
- **Parar**: para e reinicia ao início
- **Volume**: Slider de 0 a 100% com 10 divisões

## 📦 Pacotes Utilizados

| Pacote | Versão | Uso |
|--------|--------|-----|
| `audioplayers` | ^6.1.0 | Player com play, pause, stop e setVolume |

## 🏃 Como Executar

```bash
cd executando_sons_player_app
flutter pub get
flutter run
```

## 📂 Estrutura

```
lib/
├── main.dart    # Ponto de entrada do app
└── Home.dart    # Player com Slider e botões de controle
assets/
├── audios/      # musica.mp3
└── images/      # executar.png, pausar.png, parar.png
```

## 📝 Conceitos Demonstrados

- `AudioPlayer.play(AssetSource(...))` para reprodução local
- `AudioPlayer.pause()` / `AudioPlayer.resume()` / `AudioPlayer.stop()`
- `AudioPlayer.setVolume(double)` para controle de volume dinâmico
- Controle de estado de reprodução com `_primeiraExecucao`
