import 'package:flutter/material.dart';
class SegundaTela extends StatefulWidget {
  @override
  _SegundaTelaState createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda Tela"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.yellow,
        padding: EdgeInsets.all(16),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Você está na segunda tela",
              style: TextStyle(
                backgroundColor: Colors.green,
              ),)
          ],
        ),
      ),
    );
  }
}
