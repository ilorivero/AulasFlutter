# interface_app3

Aplicativo Flutter para demonstrar **navegação entre telas** com `Navigator.push` e `Navigator.pop`.

## 📖 Descrição

Ilustra o modelo de navegação com pilha de rotas do Flutter. A primeira tela contém um botão que navega para uma segunda tela com cores distintas; a AppBar da segunda tela gera automaticamente um botão "voltar".

## 📦 Requisitos

- Flutter SDK `>=3.5.0 <4.0.0`

## 🏃 Como Executar

```bash
cd interface_app3
flutter pub get
flutter run
```

## 📂 Estrutura

```
lib/
├── main.dart          # Ponto de entrada
├── PrimeiraTela.dart  # Tela inicial com botão de navegação
└── SegundaTela.dart   # Segunda tela com AppBar laranja e fundo amarelo
```

## 📝 Conceitos Demonstrados

- `Navigator.push` com `MaterialPageRoute` para navegar entre telas
- `Navigator.pop` automático pelo botão "voltar" da AppBar
- Customização visual de `AppBar` por tela
- Organização em múltiplos arquivos de tela
