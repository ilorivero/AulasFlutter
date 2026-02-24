# banco_dados_app

Um aplicativo Flutter para demonstrar operações com banco de dados **SQLite** usando o pacote `sqflite`.

## 📖 Descrição

Este projeto é uma introdução ao armazenamento local de dados relacionais no Flutter. Ele demonstra as quatro operações fundamentais de banco de dados — **CRUD (Create, Read, Update, Delete)** — em uma tabela de usuários.

## 🚀 Funcionalidades

- **Criar**: Inserir um novo usuário (nome + idade) no banco local
- **Listar todos**: Buscar e exibir todos os usuários cadastrados
- **Listar um**: Buscar um usuário específico pelo `id`
- **Atualizar**: Modificar o nome e a idade de um usuário pelo `id`
- **Excluir**: Remover um usuário com base em nome e idade

## 📦 Pacotes Utilizados

| Pacote | Versão | Uso |
|--------|--------|-----|
| `sqflite` | ^2.4.0 | Banco de dados SQLite local |
| `path` | ^1.9.0 | Montar o caminho do arquivo de banco de dados |

## 🏃 Como Executar

```bash
cd banco_dados_app
flutter pub get
flutter run
```

## 📂 Estrutura

```
lib/
└── main.dart   # Tela principal com operações CRUD de usuários
```

## 📝 Conceitos Demonstrados

- Criação de banco de dados com `openDatabase`
- Operações SQL com `rawQuery`, `insert`, `update`, `delete`
- Uso de placeholders (`?`) para evitar SQL Injection
- Gerenciamento de caminhos com o pacote `path`
