# exemplolistviewcrud

Aplicativo Flutter com **ListView** e CRUD de produtos via SQLite, separado em múltiplas telas.

## 📖 Descrição

Demonstra o uso de `ListView` em conjunto com operações de banco de dados SQLite, com telas separadas para listagem, adição e edição de produtos.

## 🚀 Funcionalidades

- **Listar produtos**: lista com `ListTile` e botões de ação
- **Adicionar produto**: formulário com nome, código e valor
- **Editar produto**: atualização dos dados do produto
- **Excluir produto**: remoção com SnackBar de confirmação

## 📦 Pacotes Utilizados

| Pacote | Versão | Uso |
|--------|--------|-----|
| `sqflite` | ^2.4.0 | Banco de dados SQLite local |
| `path` | ^1.9.0 | Construção do caminho do arquivo do banco |

## 🏃 Como Executar

```bash
cd exemplolistviewcrud
flutter pub get
flutter run
```

## 📂 Estrutura

```
lib/
├── main.dart               # Ponto de entrada do app
├── db.dart                 # Classe BancoSQLite (acesso a dados)
├── listar_produtos.dart    # Tela de listagem com cards e ações
├── adicionar_produtos.dart # Tela para adicionar produto
└── editar_produto.dart     # Tela para editar produto
```

## 📝 Conceitos Demonstrados

- `ListView` dinâmica com dados do SQLite
- `Future.delayed` para aguardar abertura do banco
- Separação de telas em múltiplos arquivos
- Cards com `ListTile`, ícones de editar e excluir
- `SnackBar` para feedback ao usuário
