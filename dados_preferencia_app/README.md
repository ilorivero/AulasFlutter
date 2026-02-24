# dados_preferencia_app

Um aplicativo Flutter para demonstrar persistência de dados simples com **SharedPreferences** (API legada).

## 📖 Descrição

Este projeto mostra como salvar, recuperar e remover pares chave-valor de forma persistente utilizando o pacote `shared_preferences`. É ideal para armazenar preferências de usuário, configurações simples e pequenas quantidades de dados.

## 🚀 Funcionalidades

- **Salvar**: Persiste um texto digitado pelo usuário com a chave `"nome"`
- **Recuperar**: Lê e exibe o texto salvo anteriormente
- **Remover**: Apaga o dado associado à chave `"nome"`

## 📦 Pacotes Utilizados

| Pacote | Versão | Uso |
|--------|--------|-----|
| `shared_preferences` | ^2.3.0 | Armazenamento de dados simples no dispositivo |

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
└── Home.dart   # Tela com operações de SharedPreferences
```

## 📝 Conceitos Demonstrados

- Uso de `SharedPreferences.getInstance()` (API síncrona com cache)
- Salvar string com `prefs.setString(chave, valor)`
- Recuperar string com `prefs.getString(chave)`
- Remover dado com `prefs.remove(chave)`
- Atualização de UI com `setState`

> **Nota:** Veja também o projeto [`shared_preferences`](../shared_preferences) que demonstra a API moderna `SharedPreferencesAsync`.
