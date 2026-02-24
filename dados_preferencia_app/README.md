# dados_preferencia_app

Aplicativo Flutter para demonstrar persistência de dados com **SharedPreferences** (API legada).

## 📖 Descrição

Mostra como salvar, recuperar e remover pares chave-valor de forma persistente usando o pacote `shared_preferences` com a API clássica baseada em `getInstance()`.

## 🚀 Funcionalidades

- **Salvar**: persiste texto digitado com a chave `"nome"`
- **Recuperar**: lê e exibe o texto salvo
- **Remover**: apaga o dado associado à chave

## 📦 Pacotes Utilizados

| Pacote | Versão | Uso |
|--------|--------|-----|
| `shared_preferences` | ^2.3.2 | Armazenamento local de dados simples |

## 🏃 Como Executar

```bash
cd dados_preferencia_app
flutter pub get
flutter run
```

## 📂 Estrutura

```
lib/
├── main.dart   # Ponto de entrada do app
└── Home.dart   # Tela com as operações de SharedPreferences
```

## 📝 Conceitos Demonstrados

- `SharedPreferences.getInstance()` (API com cache)
- `prefs.setString` / `prefs.getString` / `prefs.remove`
- `setState` para atualizar a UI após operações assíncronas

> Compare com [`shared_preferences`](../shared_preferences) que usa a API moderna `SharedPreferencesAsync`.
