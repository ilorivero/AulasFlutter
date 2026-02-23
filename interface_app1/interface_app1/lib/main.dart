import 'package:flutter/material.dart';

void main() => runApp(MyApp()); //código em apenas uma linha

//widget inicial, retornamos um MaterialApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //MaterialaPP definido apenas uma vez no APP inteiro
    return MaterialApp(
      debugShowCheckedModeBanner: false, //tira a faixa debug
      theme: ThemeData(primaryColor: Colors.blue),
      //Scafoold permite adicionar novos widgets do Material design nele
      home: HomePage(),
    );
  }
}

//criar um widget customizado
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cães Bonitinhos"),
        centerTitle: true,
      ), //propriedade
      //Cria-se o layout em sim no body
      body: _img(),
    );
  }

  _body() {
    return Container(
      color: Colors.white,
      child: Center(
        child: _button(),
      ),
    );
  }
  _button() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.purple,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold)
        ),
        child: Text(
          "Ok",
          style: TextStyle(
            color: Colors.white,
          ) ,
        ),
        onPressed: () => print("Clicou no botão ok!")
    );
  }

  _img() {
    return Image.asset("assets/images/cao.jpeg",
      fit: BoxFit.cover,
    );
  }

  _text() {
    return Text(
      "Texto na pagina",
      style: TextStyle(
        color: Colors.blue,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.dashed,
      ),
    );
  }


}

