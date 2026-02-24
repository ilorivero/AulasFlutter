import 'package:flutter/material.dart';
import 'adicionar_produtos.dart'; // Tela para adicionar novos produtos
import 'editar_produto.dart'; // Tela para editar produtos existentes
import 'db.dart'; // Classe de acesso ao banco de dados SQLite

/// Ponto de entrada do aplicativo de gerenciamento de produtos.
void main() {
  runApp(MyApp());
}

/// Widget raiz do aplicativo.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

/// Widget da tela principal que lista todos os produtos cadastrados.
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

/// Estado associado ao widget [Home].
/// Gerencia a lista de produtos e a comunicação com o banco de dados.
class _HomeState extends State<Home> {
  /// Lista de produtos recuperados do banco de dados SQLite.
  List<Map> listaProdutos = [];

  /// Instância da classe de acesso ao banco de dados.
  late BancoSQLite bancoSQLite;

  @override
  void initState() {
    super.initState();
    // Inicializa o banco de dados ao criar o widget.
    _initializeDatabase();
  }

  /// Abre o banco de dados e carrega a lista inicial de produtos.
  Future<void> _initializeDatabase() async {
    bancoSQLite = BancoSQLite();
    await bancoSQLite.open(); // Cria ou abre o arquivo de banco de dados.
    await recuperaProdutos(); // Carrega os produtos para a tela.
  }

  /// Busca todos os produtos no banco de dados e atualiza a tela.
  ///
  /// Executa uma consulta SQL bruta para obter todos os registros
  /// da tabela 'produtos' e chama [setState] para redesenhar a lista.
  Future<void> recuperaProdutos() async {
    List<Map<dynamic, dynamic>> recuperaProdutos = await bancoSQLite.db
        .rawQuery('SELECT * FROM produtos');
    setState(() {
      listaProdutos = recuperaProdutos;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Garante que a lista seja atualizada a cada rebuild da tela.
    recuperaProdutos();
    return Scaffold(
      appBar: AppBar(title: const Text("Produtos")),
      // Botão flutuante para navegar à tela de adição de produtos.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return AdicionarProduto();
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            // Exibe mensagem de lista vazia ou a lista de produtos.
            child: listaProdutos.isEmpty
                ? const Text("Sem produtos cadastrados.")
                : Column(
                    children: listaProdutos.map((prod) {
                      return Card(
                        child: ListTile(
                          leading: const Icon(Icons.wallet_giftcard),
                          title: Text(prod["nome"]),
                          subtitle: Text(
                            "Código: ${prod["codigo"]}, Valor: ${prod["valor"]}",
                          ),
                          // Botões de ação: Editar e Excluir.
                          trailing: Wrap(
                            children: [
                              // Navega para a tela de edição do produto selecionado.
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return EditarProduto(
                                          codigo: prod["codigo"],
                                        );
                                      },
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              // Exclui o produto do banco de dados e atualiza a lista.
                              IconButton(
                                onPressed: () async {
                                  await bancoSQLite.db.rawDelete(
                                    "DELETE FROM produtos WHERE codigo = ?",
                                    [prod["codigo"]],
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Produto Apagado"),
                                    ),
                                  );
                                  await recuperaProdutos();
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
          ),
        ],
      ),
    );
  }
}
