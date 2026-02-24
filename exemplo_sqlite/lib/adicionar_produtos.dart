import 'package:flutter/material.dart';
import 'db.dart'; // Acesso ao banco de dados SQLite

/// Tela para adicionar um novo produto ao banco de dados.
///
/// Exibe um formulário com campos para nome, código e valor do produto.
class AdicionarProduto extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AdicionarProduto();
  }
}

/// Estado associado ao widget [AdicionarProduto].
class _AdicionarProduto extends State<AdicionarProduto> {
  /// Controlador para o campo de texto do nome do produto.
  final TextEditingController produto_nome = TextEditingController();

  /// Controlador para o campo de texto do código do produto.
  final TextEditingController produto_codigo = TextEditingController();

  /// Controlador para o campo de texto do valor do produto.
  final TextEditingController produto_valor = TextEditingController();

  /// Instância da classe de acesso ao banco de dados.
  BancoSQLite bancoSQLite = BancoSQLite();

  @override
  void initState() {
    // Abre o banco de dados ao inicializar a tela.
    bancoSQLite.open();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Adicionar Produto")),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            // Campo de entrada para o nome do produto.
            TextField(
              controller: produto_nome,
              decoration: const InputDecoration(hintText: "Nome do produto"),
            ),
            // Campo de entrada para o código do produto.
            TextField(
              controller: produto_codigo,
              decoration: const InputDecoration(hintText: "Código"),
            ),
            // Espaço reservado para um futuro leitor de código de barras.
            ElevatedButton(
              onPressed: () {},
              child: const Icon(Icons.barcode_reader),
            ),
            // Campo de entrada para o valor do produto.
            TextField(
              controller: produto_valor,
              decoration: const InputDecoration(hintText: "Valor"),
            ),
            // Botão para salvar o produto no banco de dados.
            ElevatedButton(
              onPressed: () {
                // Insere o novo produto com os valores dos campos de texto.
                bancoSQLite.db.rawInsert(
                  "INSERT INTO produtos (nome, codigo, valor) VALUES (?, ?, ?);",
                  [produto_nome.text, produto_codigo.text, produto_valor.text],
                );

                // Exibe uma mensagem de confirmação na parte inferior da tela.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Produto Adicionado")),
                );

                // Limpa os campos após salvar para permitir nova entrada.
                produto_nome.text = "";
                produto_codigo.text = "";
                produto_valor.text = "";

                // Retorna para a tela anterior.
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return AdicionarProduto();
                    },
                  ),
                );
              },
              child: const Text("Salvar Produto"),
            ),
          ],
        ),
      ),
    );
  }
}
