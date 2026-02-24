# interface_app1

Aplicativo Flutter de demonstração de widgets básicos de interface: **imagens**, **botões estilizados** e **textos formatados**.

## 📖 Descrição

Este projeto introduz os conceitos fundamentais de interface no Flutter, mostrando como trabalhar com imagens a partir de assets locais, criar widgets personalizados e estilizar botões e textos.

## 🚀 Funcionalidades

- Exibição de imagem a partir de assets locais (`assets/images/`)
- `ElevatedButton` com estilos personalizados (cor, padding, fonte)
- Widget `Text` com decorações avançadas
- AppBar com título centralizado

## 📦 Requisitos

- Flutter SDK `>=3.5.0 <4.0.0`

## 🏃 Como Executar

```bash
cd interface_app1
flutter pub get
flutter run
```

## 📂 Estrutura

```
lib/
└── main.dart             # Tela principal com widgets de demonstração
assets/
└── images/               # Imagens utilizadas no app
```

## 📝 Conceitos Demonstrados

- `Image.asset` com `BoxFit.cover`
- `ElevatedButton.styleFrom` com `foregroundColor`, `padding`, `textStyle`
- `Text` com `TextStyle` (decoração, cor, tamanho)
- Declaração de assets no `pubspec.yaml`
