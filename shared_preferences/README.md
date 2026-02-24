# shared_preferences

Aplicativo Flutter para demonstrar persistência de dados com a API moderna **SharedPreferencesAsync**.

## 📖 Descrição

Usa o pacote `shared_preferences` com a nova API assíncrona `SharedPreferencesAsync`. Ao contrário da API legada, cada operação acessa o armazenamento diretamente, sem cache interno.

## 🚀 Funcionalidades

- **Salvar**: persiste texto com a chave `"nome"`
- **Recuperar**: lê e exibe o texto salvo
- **Remover**: apaga o dado da chave

## 📦 Pacotes Utilizados

| Pacote | Versão | Uso |
|--------|--------|-----|
| `shared_preferences` | ^2.3.2 | Armazenamento persistente de dados simples |

## 🏃 Como Executar

```bash
cd shared_preferences
flutter pub get
flutter run
```

## 📂 Estrutura

```
lib/
├── main.dart   # Ponto de entrada do app
└── Home.dart   # Tela com operações de SharedPreferencesAsync
```

## 📝 Conceitos Demonstrados

- `SharedPreferencesAsync` — nova API sem cache, acesso direto ao disco
- `await prefs.setString` / `prefs.getString` / `prefs.remove`
- Operador `??` para tratar retorno nulo de `getString`

> Compare com [`dados_preferencia_app`](../dados_preferencia_app) que usa a API legada.
