# bottomnavigationbar

Aplicativo Flutter com **BottomNavigationBar** de 4 abas: Início, Perfil, Saldo e Mapa.

## 📖 Descrição

Demonstra como criar um menu inferior (`BottomNavigationBar`) com múltiplas abas. Cada aba exibe um conteúdo diferente, gerenciado por um índice de estado no widget pai.

## 🚀 Funcionalidades

- 4 abas com ícones e rótulos: Início, Perfil, Saldo e Mapa
- Troca de conteúdo ao tocar em cada aba
- Destaque da aba selecionada com cor amarela
- Fundo preto no menu inferior

## 📦 Requisitos

- Flutter SDK `>=3.5.0 <4.0.0`

## 🏃 Como Executar

```bash
cd bottomnavigationbar
flutter pub get
flutter run
```

## 📂 Estrutura

```
lib/
├── main.dart   # Widget principal com BottomNavigationBar e gerenciamento de índice
├── Mapa.dart   # Conteúdo da aba Mapa
├── Perfil.dart # Conteúdo da aba Perfil
└── Saldo.dart  # Conteúdo da aba Saldo
```

## 📝 Conceitos Demonstrados

- `BottomNavigationBar` com `BottomNavigationBarItem`
- `selectedItemColor` / `unselectedItemColor` para feedback visual
- Gerenciamento de índice com `setState` e `onTap`
- Múltiplos widgets de tela em lista `List<Widget>`
