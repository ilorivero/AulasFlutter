# exemplolistviewcrud

Aplicativo Flutter com **ListView**, CRUD de produtos via SQLite, e espaço reservado para leitura de código de barras.

## 📖 Descrição

Este projeto demonstra o uso de `ListView` em combinação com operações de banco de dados SQLite. Foi originalmente desenvolvido com suporte ao leitor de código de barras (`flutter_barcode_scanner`), porém esse pacote foi descontinuado e a funcionalidade de escaneamento foi desabilitada.

## 🚀 Funcionalidades

- **Listar produtos**: Exibe todos os produtos em cards usando ListView
- **Adicionar produto**: Tela com campos para nome, código e valor
- **Editar produto**: Tela para atualização dos dados do produto
- **Excluir produto**: Remove o produto com feedback de SnackBar
- *(Desabilitado)* **Leitor de código de barras**: Reservado para uso futuro

## 📦 Pacotes Utilizados

| Pacote | Versão | Uso |
|--------|--------|-----|
| `sqflite` | ^2.4.0 | Banco de dados SQLite local |
| `path` | ^1.9.0 | Construção de caminhos de arquivo |

> ⚠️ O pacote `flutter_barcode_scanner` foi **removido** por estar descontinuado. A funcionalidade de leitura de código de barras pode ser implementada com uma alternativa como `mobile_scanner`.

## 🏃 Como Executar

```bash
cd exemplolistviewcrud
flutter pub get
flutter run
```

## 📂 Estrutura

```
lib/
├── main.dart              # Tela principal com lista de produtos
├── db.dart                # Classe BancoSQLite
├── adicionar_produtos.dart # Tela para adicionar produto
└── editar_produto.dart    # Tela para editar produto
```

## 📝 Conceitos Demonstrados

- ListView dinâmica com dados do SQLite
- Uso de `Future.delayed` para aguardar abertura do banco
- Estrutura CRUD completa em múltiplos arquivos
- Cards com ações de editar e excluir
