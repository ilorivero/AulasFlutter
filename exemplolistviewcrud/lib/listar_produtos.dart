
import 'package:flutter/material.dart';
import 'db.dart';
import 'editar_produto.dart';

class ListarProdutos extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _ListarProdutos();
  }

}

class _ListarProdutos extends State<ListarProdutos>{

  List<Map> listaProdutos = [];
  BancoSQLite bancoSQLite = new BancoSQLite();

  @override
  void initState() {
    bancoSQLite.open();
    recuperaProdutos();
    super.initState();
  }

  recuperaProdutos(){
    Future.delayed(Duration(milliseconds: 500),() async {
        listaProdutos = await bancoSQLite.db.rawQuery('SELECT * FROM produtos');
        setState(() { });
    });
  }


  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
           title: Text("Lista de Produtos"),
        ),
        body: SingleChildScrollView(
          child: Container(
             child: listaProdutos.length == 0?Text("Sem produtos cadastrados."):
             Column( 
                children: listaProdutos.map((prod){
                     return Card(
                       child: ListTile(
                          leading: Icon(Icons.wallet_giftcard),
                          title: Text(prod["nome"]),
                          subtitle: Text("Código:" + prod["codigo"].toString() + ", Valor: " + prod["valor"]),
                          trailing: Wrap(children: [

                              IconButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                                    return EditarProduto(codigo: prod["codigo"]);
                                }));
                              }, icon: Icon(Icons.edit)),


                              IconButton(onPressed: () async {
                                   await bancoSQLite.db.rawDelete("DELETE FROM produtos WHERE codigo = ?", [prod["codigo"]]);
                                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Produto Apagado")));
                                   recuperaProdutos();
                              }, icon: Icon(Icons.delete, color:Colors.red))


                          ],),
                       ),
                     );
                }).toList(),
             ), 
          ),
        ),
     );
  }
}
