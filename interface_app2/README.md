# interface_app2

Aplicativo Flutter com **tela de menu unificada** para testar múltiplos widgets de entrada de dados.

## 📖 Descrição

Reúne cinco exemplos de widgets de entrada do Flutter em uma única tela inicial com cards de navegação. Basta tocar no card do widget desejado para abrir o exemplo correspondente.

## 🚀 Exemplos Disponíveis

| Card | Arquivo | Widget | Descrição |
|------|---------|--------|-----------|
| 🔵 Campo de Texto | `CampoTexto.dart` | `TextField` | Captura texto com `TextEditingController` |
| 🟢 CheckBox | `EntradaCheckBox.dart` | `CheckboxListTile` | Lista de compras com seleção múltipla |
| 🟠 RadioButton | `EntradaRadioButton.dart` | `RadioListTile<String>` | Pesquisa com seleção única |
| 🔴 Slider | `EntradaSlider.dart` | `Slider` | Controle deslizante com rótulo dinâmico |
| 🟣 Switch | `EntradaSwitch.dart` | `SwitchListTile` | Ativação/desativação de opções |

## 📦 Requisitos

- Flutter SDK `>=3.5.0 <4.0.0`

## 🏃 Como Executar

```bash
cd interface_app2
flutter pub get
flutter run
```

Ao abrir, toque em qualquer card para navegar ao exemplo. Use o botão "voltar" (←) da AppBar para retornar ao menu.

## 📂 Estrutura

```
lib/
├── main.dart               # Menu principal com GridView de cards
├── CampoTexto.dart         # Exemplo de TextField
├── EntradaCheckBox.dart    # Exemplo de CheckboxListTile
├── EntradaRadioButton.dart # Exemplo de RadioListTile
├── EntradaSlider.dart      # Exemplo de Slider
└── EntradaSwitch.dart      # Exemplo de SwitchListTile
```

## 📝 Conceitos Demonstrados

- `GridView.builder` com `SliverGridDelegateWithFixedCrossAxisCount`
- `Navigator.push` + `MaterialPageRoute` para navegação entre telas
- `TextEditingController` para captura de texto
- `CheckboxListTile` com `onChanged: (bool? valor)`
- `RadioListTile<String>` com `groupValue`
- `Slider` com `min`, `max`, `divisions`, `label` dinâmico
- `SwitchListTile` para configurações on/off
