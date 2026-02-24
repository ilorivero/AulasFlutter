# interface_app3

Aplicativo Flutter para demonstrar **navegação entre telas** usando `Navigator.push` e `Navigator.pop`.

## 📖 Descrição

Este projeto ilustra o modelo de navegação com pilha de rotas do Flutter (Navigator). A tela inicial contém um botão que navega para a segunda tela, e a segunda tela inclui um botão "voltar" automático na AppBar.

## 🚀 Funcionalidades

- Navegação da primeira para a segunda tela com `Navigator.push`
- Retorno automático com o botão "voltar" na AppBar (`Navigator.pop`)
- Destaque visual das telas com cores diferentes

## 🏃 Como Executar

```bash
cd interface_app3/interface_app3
flutter pub get
flutter run
```

## 📂 Estrutura

```
lib/
├── main.dart          # Ponto de entrada do app
├── PrimeiraTela.dart  # Primeira tela com botão de navegação
└── SegundaTela.dart   # Segunda tela com cores de destaque
```

## 📝 Conceitos Demonstrados

- `Navigator.push` com `MaterialPageRoute` para navegar entre telas
- `Navigator.pop` para retornar à tela anterior
- Passagem da `BuildContext` para o Navigator
- Organização do projeto com múltiplos arquivos de tela
- Customização de `AppBar` com cores diferentes por tela
