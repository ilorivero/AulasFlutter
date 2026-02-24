# interface_app2

Aplicativo Flutter com uma **tela de menu unificada** que permite testar todos os widgets de entrada de uma só vez.

## 📖 Descrição

Este projeto reúne cinco exemplos de widgets de entrada do Flutter. Ao invés de editar o `main.dart` para alternar entre os exemplos, agora existe uma **tela principal com cards de navegação** — basta tocar no card do widget desejado para abrir o exemplo correspondente.

## 🚀 Exemplos Disponíveis

| Card | Arquivo | Widget | Descrição |
|------|---------|--------|-----------|
| 🟦 Campo de Texto | `CampoTexto.dart` | `TextField` | Captura de texto com `TextEditingController` |
| 🟩 CheckBox | `EntradaCheckBox.dart` | `CheckboxListTile` | Lista de compras com seleção múltipla |
| 🟧 RadioButton | `EntradaRadioButton.dart` | `RadioListTile` | Pesquisa de satisfação com seleção única |
| 🟥 Slider | `EntradaSlider.dart` | `Slider` | Controle deslizante com rótulo dinâmico |
| 🟪 Switch | `EntradaSwitch.dart` | `SwitchListTile` | Ativação/desativação de notificações |

## 🏃 Como Executar

```bash
cd interface_app2/interface_app2
flutter pub get
flutter run
```

Ao abrir o aplicativo, você verá o menu com os 5 cards. Toque em qualquer card para navegar ao exemplo correspondente. Use o botão "voltar" (←) para retornar ao menu.

## 📂 Estrutura

```
lib/
├── main.dart               # Menu principal com GridView de navegação
├── CampoTexto.dart         # Exemplo de TextField
├── EntradaCheckBox.dart    # Exemplo de CheckboxListTile
├── EntradaRadioButton.dart # Exemplo de RadioListTile
├── EntradaSlider.dart      # Exemplo de Slider
└── EntradaSwitch.dart      # Exemplo de SwitchListTile
```

## 📝 Conceitos Demonstrados

- `GridView.builder` para exibir uma grade de cards
- `Navigator.push` com `MaterialPageRoute` para navegar entre telas
- `TextEditingController` para capturar e gerenciar texto
- `CheckboxListTile` com callbacks `onChanged: (bool? valor)`
- `RadioListTile<String>` com `groupValue` para seleção exclusiva
- `Slider` com `min`, `max`, `divisions` e `label` dinâmico
- `SwitchListTile` para configurações on/off
- `setState` para atualização reativa da interface
