import 'package:flutter/material.dart';

/// Widget de tela para demonstrar o uso do campo de texto (TextField).
///
/// Este exemplo mostra como capturar a entrada do usuário usando
/// [TextEditingController] e exibi-la ao pressionar um botão.
class CampoTexto extends StatefulWidget {
  @override
  _CampoTextoState createState() => _CampoTextoState();
}

/// Estado associado ao widget [CampoTexto].
class _CampoTextoState extends State<CampoTexto> {
  /// Controlador para gerenciar o texto digitado no [TextField].
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Entrada de dados")),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(32),
            child: TextField(
              // Define o tipo de teclado a ser exibido.
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(labelText: "Digite um valor: "),
              style: const TextStyle(fontSize: 30, color: Colors.red),
              // Associa o controlador ao campo de texto.
              controller: _textEditingController,
            ),
          ),
          ElevatedButton(
            // backgroundColor substitui o parâmetro 'primary' que foi removido no Flutter 3.x.
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {
              // Exibe no console o texto que foi digitado pelo usuário.
              print("Texto digitado: ${_textEditingController.text}");
            },
            child: const Text("Salvar"),
          ),
        ],
      ),
    );
  }
}
