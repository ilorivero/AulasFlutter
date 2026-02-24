import 'package:flutter/material.dart';
import 'db.dart'; // Acesso ao banco de dados SQLite

/// Tela para editar os dados de um produto existente.
///
/// Recebe o [codigo] do produto como parâmetro e pré-preenche o formulário
/// com os dados do produto encontrado no banco de dados.
class EditarProduto extends StatefulWidget {
  /// Código original do produto a ser editado.
  /// Usado para buscar os dados no banco e filtrar o UPDATE.
  int codigo;
  EditarProduto({required this.codigo});

  @override
  State<StatefulWidget> createState() {
    return _EditStudent();
  }
}

/// Estado associado ao widget [EditarProduto].
class _EditStudent extends State<EditarProduto> {
  /// Controlador para o campo de texto do nome do produto.
  final TextEditingController nome = TextEditingController();

  /// Controlador para o campo de texto do código do produto.
  final TextEditingController codigo = TextEditingController();

  /// Controlador para o campo de texto do valor do produto.
  final TextEditingController valor = TextEditingController();

  /// Instância da classe de acesso ao banco de dados.
  BancoSQLite bancoSQLite = BancoSQLite();

  @override
  void initState() {
    // Abre o banco de dados ao inicializar a tela.
    bancoSQLite.open();

    // Aguarda 500ms para garantir que o banco abriu antes de consultar.
    Future.delayed(const Duration(milliseconds: 500), () async {
      // Busca o produto pelo código passado como parâmetro.
      var data = await bancoSQLite.pegaProduto(widget.codigo);
      if (data != null) {
        // Pré-preenche os campos do formulário com os dados do produto.
        nome.text = data["nome"];
        codigo.text = data["codigo"].toString();
        valor.text = data["valor"];
      } else {
        print("Nenhum produto com código: " + widget.codigo.toString());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Editar Produto")),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            // Campo para editar o nome do produto.
            TextField(
              controller: nome,
              decoration: const InputDecoration(hintText: "Nome do Produto"),
            ),
            // Campo para editar o código do produto.
            TextField(
              controller: codigo,
              decoration: const InputDecoration(hintText: "Código"),
            ),
            // Campo para editar o valor do produto.
            TextField(
              controller: valor,
              decoration: const InputDecoration(hintText: "Valor"),
            ),
            // Botão para confirmar a atualização dos dados no banco.
            ElevatedButton(
              onPressed: () {
                // Executa o UPDATE usando SQL bruto com placeholders seguros.
                bancoSQLite.db.rawInsert(
                  "UPDATE produtos SET nome = ?, codigo = ?, valor = ? WHERE codigo = ?",
                  [nome.text, codigo.text, valor.text, widget.codigo],
                );
                // Mostra uma confirmação após a atualização.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Produto Atualizado")),
                );
                // Volta para a tela anterior.
                Navigator.pop(context);
              },
              child: const Text("Atualizar dados do Produto"),
            ),
          ],
        ),
      ),
    );
  }
}
