# banco_dados_app

Aplicativo Flutter para demonstrar operações básicas de banco de dados **SQLite** com `sqflite`.

## 📖 Descrição

Introdução ao armazenamento local de dados relacionais no Flutter. Demonstra as quatro operações fundamentais de banco — **CRUD** — em uma tabela de usuários, tudo em um único arquivo `main.dart`.

## 🚀 Funcionalidades

- **Criar**: inserir usuário (nome + idade)
- **Listar todos**: buscar todos os usuários cadastrados
- **Listar um**: buscar usuário pelo `id`
- **Atualizar**: modificar nome e idade pelo `id`
- **Excluir**: remover usuário por nome e idade

## 📦 Pacotes Utilizados

| Pacote | Versão | Uso |
|--------|--------|-----|
| `sqflite` | ^2.4.0 | Banco de dados SQLite local |
| `path` | ^1.9.0 | Montagem do caminho do arquivo de banco |

## 🏃 Como Executar

```bash
cd banco_dados_app
flutter pub get
flutter run
```

## 📂 Estrutura

```
lib/
└── main.dart   # Tela principal com todas as operações CRUD
```

## 📝 Conceitos Demonstrados

- Criação do banco com `openDatabase` e callback `onCreate`
- `rawQuery`, `insert`, `update`, `delete` com placeholders `?`
- `path.join` para construir o caminho do banco de dados
