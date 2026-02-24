# AulasFlutter

Repositório de projetos Flutter desenvolvidos para as aulas de **Programação para Dispositivos Móveis**. Cada pasta contém um projeto independente que demonstra um conjunto específico de conceitos do Flutter e do Dart.

## 📁 Projetos

### 🗄️ Banco de Dados

| Projeto | Descrição | Pacote Principal |
|---------|-----------|-----------------|
| [banco_dados_app](./banco_dados_app) | Operações CRUD básicas em SQLite com SQL manual | `sqflite` |
| [exemplo_sqlite](./exemplo_sqlite) | CRUD completo de produtos com telas separadas e classe DAL | `sqflite` |
| [exemplolistviewcrud](./exemplolistviewcrud) | ListView com CRUD via SQLite e suporte a código de barras (desabilitado) | `sqflite` |

### 💾 Persistência de Dados

| Projeto | Descrição | Pacote Principal |
|---------|-----------|-----------------|
| [dados_preferencia_app](./dados_preferencia_app) | SharedPreferences legada para salvar/recuperar/remover dados | `shared_preferences` |
| [shared_preferences](./shared_preferences) | API moderna `SharedPreferencesAsync` para persistência local | `shared_preferences` |

### 🎨 Interface e Widgets

| Projeto | Descrição | Conceitos |
|---------|-----------|-----------|
| [interface_app1](./interface_app1/interface_app1) | Widgets básicos: imagens, botões, textos | `Image.asset`, `ElevatedButton`, `Text` |
| [interface_app2](./interface_app2/interface_app2) | Widgets de entrada: TextField, CheckBox, RadioButton, Slider, Switch | Inputs, `setState` |
| [interface_app3](./interface_app3/interface_app3) | Navegação entre telas com Navigator | `Navigator.push`, `Navigator.pop` |

---

## ⚠️ Projetos Incompletos

As seguintes pastas existem no repositório mas **não contêm projetos Flutter completos**:

- **`navegacao/`** — Pasta com estrutura incompleta, sem `pubspec.yaml` nem código principal. Possivelmente um rascunho inicial de estudos de navegação.
- **`iothealth/`** — Pasta com conteúdo mínimo, provavelmente um projeto de IoT para saúde que ainda não foi desenvolvido.

---

## 🛠️ Requisitos

- **Flutter SDK**: >= 3.x (recomenda-se a versão estável mais recente)
- **Dart SDK**: >= 2.12.0 < 4.0.0
- **Android Studio** ou **VS Code** com extensão Flutter

## 🏃 Como executar um projeto

1. Navegue até a pasta do projeto desejado:
   ```bash
   cd nome_do_projeto
   ```
2. Instale as dependências:
   ```bash
   flutter pub get
   ```
3. Execute o aplicativo:
   ```bash
   flutter run
   ```

## 📚 Tópicos Abordados

- ✅ Widgets Stateless e Stateful
- ✅ Banco de dados local com SQLite (`sqflite`)
- ✅ Persistência de dados com `SharedPreferences` e `SharedPreferencesAsync`
- ✅ Widgets de entrada: `TextField`, `Checkbox`, `Radio`, `Slider`, `Switch`
- ✅ Navegação entre telas com `Navigator`
- ✅ Documentação inline em Dart (doc comments `///`)
- ✅ Null Safety (Dart 3 compatível)
