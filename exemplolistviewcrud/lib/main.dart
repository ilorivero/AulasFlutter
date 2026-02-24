import 'package:flutter/material.dart';
import 'adicionar_produtos.dart'; // Tela para adicionar novos produtos
import 'editar_produto.dart'; // Tela para editar produtos existentes
import 'db.dart'; // Classe de acesso ao banco de dados SQLite

/// Ponto de entrada do aplicativo de gerenciamento de produtos com ListView.
void main() {
  runApp(MyApp());
}

/// Widget raiz do aplicativo.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

/// Tela principal com a listagem de produtos em um ListView.
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

/// Estado associado ao widget [Home].
/// Gerencia a lista de produtos e as operações de CRUD via SQLite.
class _HomeState extends State<Home> {
  /// Lista de mapas, onde cada mapa representa um produto do banco de dados.
  List<Map> listaProdutos = [];

  /// Instância da classe que gerencia o banco de dados SQLite.
  BancoSQLite bancoSQLite = BancoSQLite();

  @override
  void initState() {
    // Abre o banco de dados e carrega os produtos na inicialização do widget.
    bancoSQLite.open();
    recuperaProdutos();
    super.initState();
  }

  /// Busca os produtos do banco de dados com um pequeno atraso.
  ///
  /// O atraso de 500ms é usado para garantir que o banco de dados
  /// tenha sido aberto antes de tentar fazer a consulta.
  recuperaProdutos() {
    Future.delayed(const Duration(milliseconds: 500), () async {
      // Consulta SQL que retorna todos os registros da tabela produtos.
      listaProdutos = await bancoSQLite.db.rawQuery('SELECT * FROM produtos');
      // Redesenha a tela com os dados atualizados.
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produtos"),
      ),
      // Botão flutuante para navegar à tela de adição de produtos.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return AdicionarProduto();
          }));
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              // Exibe mensagem caso não hajam produtos cadastrados.
              child: listaProdutos.isEmpty
                  ? const Text("Sem produtos cadastrados.")
                  : Column(
                      children: listaProdutos.map((prod) {
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.wallet_giftcard),
                            title: Text(prod["nome"]),
                            subtitle: Text("Código:" +
                                prod["codigo"].toString() +
                                ", Valor: " +
                                prod["valor"]),
                            trailing: Wrap(
                              children: [
                                // Botão para navegar à tela de edição do produto.
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (BuildContext context) {
                                        return EditarProduto(
                                            codigo: prod["codigo"]);
                                      }));
                                    },
                                    icon: const Icon(Icons.edit)),
                                // Botão para excluir o produto e exibir uma confirmação.
                                IconButton(
                                    onPressed: () async {
                                      await bancoSQLite.db.rawDelete(
                                          "DELETE FROM produtos WHERE codigo = ?",
                                          [prod["codigo"]]);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content:
                                                  Text("Produto Apagado")));
                                      recuperaProdutos();
                                    },
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red))
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
