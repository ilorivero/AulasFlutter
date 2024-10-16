import 'package:flutter/material.dart';
import 'db.dart';

class AdicionarProduto extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      return _AdicionarProduto();
  }
}

class _AdicionarProduto extends State<AdicionarProduto>{

  TextEditingController produto_nome = TextEditingController();
  TextEditingController produto_codigo = TextEditingController();
  TextEditingController produto_valor = TextEditingController();


  BancoSQLite bancoSQLite = new BancoSQLite();

  @override
  void initState() {
    bancoSQLite.open();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
       return Scaffold(
            appBar: AppBar(
              title: const Text("Adicionar Produto"),
            ),
            body:Container( 
               padding: EdgeInsets.all(30),
               child: Column(children: [
                   TextField(
                     controller: produto_nome,
                     decoration: const InputDecoration(
                        hintText: "Nome do produto",
                     ),
                   ),
                       TextField(
                         controller: produto_codigo,
                         decoration: const InputDecoration(
                            hintText: "Código",
                         ),
                       ),
ElevatedButton(onPressed: (){}, child: Icon(Icons.barcode_reader)),
                   TextField(
                     controller: produto_valor,
                     decoration: const InputDecoration(
                        hintText: "Valor",
                     ),
                   ),

                   ElevatedButton(onPressed: (){

                         bancoSQLite.db.rawInsert("INSERT INTO produtos (nome, codigo, valor) VALUES (?, ?, ?);",
                         [produto_nome.text, produto_codigo.text, produto_valor.text]);

                         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Produto Adicionado")));

                         produto_nome.text = "";
                         produto_codigo.text = "";
                         produto_valor.text = "";

                         Navigator.pop(context, MaterialPageRoute(builder: (BuildContext context){
                           return AdicionarProduto();  }));

                   }, child: const Text("Salvar Produto")),
               ],),
            )
       );
  }
}