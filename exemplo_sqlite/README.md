# exemplo_sqlite

Aplicativo Flutter com CRUD completo de produtos utilizando **SQLite**, com telas separadas para adicionar e editar registros.

## 📖 Descrição

Este projeto demonstra a arquitetura mais organizada para trabalhar com SQLite, separando a lógica de banco de dados em uma classe dedicada (`BancoSQLite`) e as telas em arquivos separados.

## 🚀 Funcionalidades

- **Listar produtos**: Exibe todos os produtos em cards com ícones de ação
- **Adicionar produto**: Tela dedicada para inserção de nome, código e valor
- **Editar produto**: Pré-preenche os campos com os dados existentes para atualização
- **Excluir produto**: Remove o produto da lista com feedback visual (SnackBar)

## 📦 Pacotes Utilizados

| Pacote | Versão | Uso |
|--------|--------|-----|
| `sqflite` | ^2.4.0 | Banco de dados SQLite local |
| `path` | ^1.9.0 | Construção de caminhos de arquivo |

## 🏃 Como Executar

```bash
cd exemplo_sqlite
flutter pub get
flutter run
```

## 📂 Estrutura

```
lib/
├── main.dart              # Tela principal com lista de produtos
├── db.dart                # Classe BancoSQLite (DAL)
├── adicionar_produtos.dart # Tela para adicionar produto
└── editar_produto.dart    # Tela para editar produto existente
```

## 📝 Conceitos Demonstrados

- Separação de responsabilidades: DAL (Data Access Layer) em `db.dart`
- `rawQuery`, `rawInsert`, `rawDelete` para SQL personalizado
- Navegação entre telas com `Navigator.push` e `Navigator.pop`
- Inicialização assíncrona com `initState` e `Future<void>`
- Feedback visual com `SnackBar`
