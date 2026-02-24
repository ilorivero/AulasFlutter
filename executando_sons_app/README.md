# executando_sons_app

Aplicativo Flutter para reprodução de sons de animais tocados a partir de assets locais.

## 📖 Descrição

Exibe três imagens de animais (cachorro, gato e vaca). Ao tocar na imagem, o som correspondente é reproduzido usando o pacote `audioplayers`.

## 🚀 Funcionalidades

- Toque em imagem → reproduz som do animal
- Sons carregados de assets locais (`assets/audios/`)
- Imagens dos animais em `assets/images/`

## 📦 Pacotes Utilizados

| Pacote | Versão | Uso |
|--------|--------|-----|
| `audioplayers` | ^6.1.0 | Reprodução de áudio local com `AssetSource` |

## 🏃 Como Executar

```bash
cd executando_sons_app
flutter pub get
flutter run
```

## 📂 Estrutura

```
lib/
├── main.dart    # Ponto de entrada do app
└── Home.dart    # Tela com as imagens e lógica de reprodução de áudio
assets/
├── audios/      # dog.mp3, cat.mp3, cow.mp3
└── images/      # dog.png, cat.png, cow.png
```

## 📝 Conceitos Demonstrados

- `AudioPlayer` com `AssetSource` (audioplayers ^6.x)
- `GestureDetector` com `onTap` para interação com imagens
- `Image.asset` para exibição de imagens de assets
- `dispose()` para liberar recursos do player
