# exemplo_sqlite

Aplicativo Flutter com **CRUD completo de produtos** em SQLite, organizado em múltiplas telas e com classe de acesso a dados dedicada.

## 📖 Descrição

Demonstra a arquitetura mais organizada para SQLite, separando a lógica de banco de dados em `BancoSQLite` e cada tela em seu próprio arquivo. Inclui tela dedicada para listagem, adição e edição de produtos.

## 🚀 Funcionalidades

- **Listar produtos**: tela própria com cards e ações de editar/excluir
- **Adicionar produto**: formulário com nome, código e valor
- **Editar produto**: pré-preenche campos com dados existentes
- **Excluir produto**: remoção com feedback visual (SnackBar)

## 📦 Pacotes Utilizados

| Pacote | Versão | Uso |
|--------|--------|-----|
| `sqflite` | ^2.4.0 | Banco de dados SQLite local |
| `path` | ^1.9.0 | Construção do caminho do arquivo do banco |

## 🏃 Como Executar

```bash
cd exemplo_sqlite
flutter pub get
flutter run
```

## 📂 Estrutura

```
lib/
├── main.dart               # Ponto de entrada do app
├── db.dart                 # Classe BancoSQLite (acesso a dados)
├── listar_produtos.dart    # Tela de listagem com cards
├── adicionar_produtos.dart # Tela para adicionar produto
└── editar_produto.dart     # Tela para editar produto existente
```

## 📝 Conceitos Demonstrados

- Padrão DAL (Data Access Layer) com `BancoSQLite`
- `rawQuery`, `rawInsert`, `rawDelete` para SQL personalizado
- `initState` assíncrono para pré-carregar dados
- `Navigator.push` / `Navigator.pop` para fluxo entre telas
- `SnackBar` para feedback ao usuário
