import 'package:flutter/material.dart';
import 'adicionar_produtos.dart';
import 'editar_produto.dart';
import 'db.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map> listaProdutos = [];
  late BancoSQLite bancoSQLite;

  @override
  void initState()  {
    super.initState();


    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    bancoSQLite = BancoSQLite();
    await bancoSQLite.open();
    await recuperaProdutos();
  }

  Future<void> recuperaProdutos() async {
    List<Map<dynamic, dynamic>> recuperaProdutos = await bancoSQLite.db.rawQuery('SELECT * FROM produtos');
    setState(() {
      listaProdutos = recuperaProdutos;
    });
  }

  @override
  Widget build(BuildContext context) {
  recuperaProdutos();
    return Scaffold(
      appBar: AppBar(
        title: Text("Produtos"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
            return AdicionarProduto();
          }));
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: listaProdutos.isEmpty
                ? Text("Sem produtos cadastrados.")
                : Column(
              children: listaProdutos.map((prod) {
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.wallet_giftcard),
                    title: Text(prod["nome"]),
                    subtitle: Text("Código: ${prod["codigo"]}, Valor: ${prod["valor"]}"),
                    trailing: Wrap(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                              return EditarProduto(codigo: prod["codigo"]);
                            }));
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () async {
                            await bancoSQLite.db.rawDelete("DELETE FROM produtos WHERE codigo = ?", [prod["codigo"]]);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Produto Apagado")));
                            await recuperaProdutos();
                          },
                          icon: Icon(Icons.delete, color: Colors.red),
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
