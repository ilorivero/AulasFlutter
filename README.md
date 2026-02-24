# AulasFlutter

Repositório de projetos Flutter desenvolvidos para as aulas de **Programação para Dispositivos Móveis**. Cada pasta é um projeto independente que demonstra um conjunto específico de conceitos do Flutter e do Dart.

## 📁 Projetos

### 🗄️ Banco de Dados

| Projeto | Descrição | Pacotes |
|---------|-----------|---------|
| [banco_dados_app](./banco_dados_app) | CRUD básico em SQLite com SQL manual em arquivo único | `sqflite`, `path` |
| [exemplo_sqlite](./exemplo_sqlite) | CRUD completo de produtos com telas separadas e classe DAL | `sqflite`, `path` |
| [exemplolistviewcrud](./exemplolistviewcrud) | ListView com CRUD via SQLite organizado em múltiplas telas | `sqflite`, `path` |

### 💾 Persistência de Preferências

| Projeto | Descrição | Pacotes |
|---------|-----------|---------|
| [dados_preferencia_app](./dados_preferencia_app) | SharedPreferences com a API clássica (`getInstance`) | `shared_preferences` |
| [shared_preferences](./shared_preferences) | SharedPreferences com a API moderna (`SharedPreferencesAsync`) | `shared_preferences` |

### 🎨 Interface e Navegação

| Projeto | Descrição | Conceitos |
|---------|-----------|-----------|
| [interface_app1](./interface_app1) | Imagens, botões estilizados e textos formatados | `Image.asset`, `ElevatedButton` |
| [interface_app2](./interface_app2) | Menu unificado com TextField, CheckBox, RadioButton, Slider e Switch | Inputs, `GridView`, `setState` |
| [interface_app3](./interface_app3) | Navegação entre duas telas com Navigator | `Navigator.push`, `Navigator.pop` |

---

## 🛠️ Requisitos

- **Flutter SDK** `>=3.5.0 <4.0.0` — [instalar Flutter](https://docs.flutter.dev/get-started/install)
- **Dart SDK** `>=3.5.0 <4.0.0` (incluído no Flutter)
- **Android Studio** ou **VS Code** com extensão Flutter/Dart

## 🏃 Como executar qualquer projeto

```bash
# Navegue até a pasta do projeto desejado
cd nome_do_projeto

# Instale as dependências
flutter pub get

# Execute
flutter run
```

## 📚 Tópicos Abordados

| Tópico | Projetos |
|--------|---------|
| Banco de dados SQLite | `banco_dados_app`, `exemplo_sqlite`, `exemplolistviewcrud` |
| Persistência local | `dados_preferencia_app`, `shared_preferences` |
| Widgets básicos (Text, Button, Image) | `interface_app1` |
| Widgets de entrada (TextField, CheckBox, Radio, Slider, Switch) | `interface_app2` |
| Navegação entre telas | `interface_app3` |
| Documentação inline Dart (`///`) | Todos os projetos |
| Null Safety (Dart 3) | Todos os projetos |
