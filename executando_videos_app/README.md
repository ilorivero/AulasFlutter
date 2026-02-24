# executando_videos_app

Aplicativo Flutter para reprodução de **vídeo local** em loop usando `video_player`.

## 📖 Descrição

Demonstra como reproduzir um arquivo de vídeo incluído nos assets locais do projeto usando o pacote `video_player`. O vídeo inicia automaticamente em loop ao abrir o app.

## 🚀 Funcionalidades

- Reprodução automática de vídeo local em loop
- Proporção de aspecto preservada com `AspectRatio`
- Indicador de carregamento enquanto o vídeo inicializa

## 📦 Pacotes Utilizados

| Pacote | Versão | Uso |
|--------|--------|-----|
| `video_player` | ^2.9.2 | Reprodução de vídeo local via `VideoPlayerController.asset` |

## 🏃 Como Executar

```bash
cd executando_videos_app
flutter pub get
flutter run
```

## 📂 Estrutura

```
lib/
├── main.dart    # Ponto de entrada do app
└── Home.dart    # Tela de reprodução de vídeo
assets/
└── videos/      # exemplo.mp4
```

## 📝 Conceitos Demonstrados

- `VideoPlayerController.asset` com `late` (null safety)
- `..initialize().then(_)` para inicialização assíncrona
- `..setLooping(true)` para repetição automática
- `_videocontroller.value.isInitialized` para renderização condicional
- `AspectRatio` para exibir o vídeo com proporção correta
- `dispose()` para liberar recursos do controller
