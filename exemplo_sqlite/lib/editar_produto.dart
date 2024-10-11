import 'package:flutter/material.dart';
import 'db.dart';

class EditarProduto extends StatefulWidget{

  int codigo;
  EditarProduto({required this.codigo});

  @override
  State<StatefulWidget> createState() {
    return _EditStudent();
  }
}

class _EditStudent extends State<EditarProduto>{
  
  TextEditingController nome = TextEditingController();
  TextEditingController codigo = TextEditingController();
  TextEditingController valor = TextEditingController();

  BancoSQLite bancoSQLite = new BancoSQLite();

  @override
  void initState() {
    bancoSQLite.open();

    Future.delayed(Duration(milliseconds: 500), () async {
        var data = await bancoSQLite.pegaProduto(widget.codigo);
        if(data != null){
            nome.text = data["nome"];
            codigo.text = data["codigo"].toString();
            valor.text = data["valor"];
            setState(() {});
        }else{
           print("Nenhum produto com código: " + widget.codigo.toString());
        }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text("Editar Produto"),
            ),
            body:Container( 
               padding: EdgeInsets.all(30),
               child: Column(children: [
                   TextField(
                     controller: nome,
                     decoration: InputDecoration(
                        hintText: "Nome do Produto",
                     ),
                   ),

                   TextField(
                     controller: codigo,
                     decoration: InputDecoration(
                        hintText: "Código",
                     ),
                   ),

                   TextField(
                     controller: valor,
                     decoration: InputDecoration(
                        hintText: "Valor",
                     ),
                   ),

                   ElevatedButton(onPressed: (){
                         bancoSQLite.db.rawInsert("UPDATE produtos SET nome = ?, codigo = ?, valor = ? WHERE codigo = ?",
                         [nome.text, codigo.text, valor.text, widget.codigo]);

                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Produto Atualizado")));

                   }, child: Text("Atualizar dados do Produto")),
               ],),
            )
       );
  }

}