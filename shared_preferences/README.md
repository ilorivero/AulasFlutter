# shared_preferences

Um aplicativo Flutter para demonstrar persistência de dados com a API moderna **SharedPreferencesAsync**.

## 📖 Descrição

Este projeto demonstra o uso do pacote `shared_preferences` com a nova API assíncrona `SharedPreferencesAsync`, que é a abordagem recomendada nas versões mais recentes do pacote. Ao contrário da API legada, a `SharedPreferencesAsync` não usa cache interno — cada operação acessa o armazenamento persistente diretamente.

## 🚀 Funcionalidades

- **Salvar**: Persiste um texto digitado pelo usuário com a chave `"nome"`
- **Recuperar**: Lê e exibe o texto salvo anteriormente
- **Remover**: Apaga o dado associado à chave `"nome"`

## 📦 Pacotes Utilizados

| Pacote | Versão | Uso |
|--------|--------|-----|
| `shared_preferences` | ^2.3.0 | Armazenamento persistente de dados simples |

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

- **`SharedPreferencesAsync`**: Nova API sem cache, acesso direto ao disco
- Diferença entre `SharedPreferences` (depreciado), `SharedPreferencesAsync` e `SharedPreferencesCached`
- Uso de `await` para operações assíncronas de leitura e escrita
- Operador `??` para valores padrão quando `getString` retorna `null`

> **Nota:** Compare com o projeto [`dados_preferencia_app`](../dados_preferencia_app) que usa a API legada `SharedPreferences.getInstance()`.
