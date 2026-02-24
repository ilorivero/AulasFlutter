# interface_app1

Aplicativo Flutter de demonstração de widgets básicos de interface, com foco em **imagens** e **botões estilizados**.

## 📖 Descrição

Este projeto introduz os conceitos fundamentais de interface no Flutter, mostrando como trabalhar com imagens a partir de assets locais, criar widgets personalizados e estilizar botões.

## 🚀 Funcionalidades

- Exibição de imagem a partir dos assets locais
- `ElevatedButton` com estilos personalizados (cor, tamanho, fonte)
- Demonstração de widget `Text` com decorações avançadas
- AppBar com título centralizado

## 📦 Pacotes Utilizados

| Pacote | Versão | Uso |
|--------|--------|-----|
| `flutter` (SDK) | - | Widgets base do Material Design |
| `cupertino_icons` | ^1.0.8 | Ícones no estilo iOS |

## 🏃 Como Executar

```bash
cd interface_app1/interface_app1
flutter pub get
flutter run
```

## 📂 Estrutura

```
lib/
└── main.dart                # Aplicativo principal com HomePage
assets/
└── images/
    └── cao.jpeg             # Imagem exibida na tela
```

## 📝 Conceitos Demonstrados

- `Image.asset` com `BoxFit.cover` para imagens responsivas
- `ElevatedButton.styleFrom` com `foregroundColor`, `padding`, `textStyle`
- `Text` com `TextStyle` incluindo decoração, cor e formatação
- `StatelessWidget` e criação de widgets customizados
- Declaração de assets no `pubspec.yaml`
