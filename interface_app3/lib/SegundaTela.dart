import 'package:flutter/material.dart';

/// Segunda tela do aplicativo de demonstração de navegação.
///
/// Acessada a partir da [PrimeiraTela] via [Navigator.push].
/// A AppBar inclui automaticamente um botão "voltar" (seta) que
/// executa [Navigator.pop] para retornar à tela anterior.
class SegundaTela extends StatefulWidget {
  @override
  _SegundaTelaState createState() => _SegundaTelaState();
}

/// Estado associado ao widget [SegundaTela].
class _SegundaTelaState extends State<SegundaTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Segunda Tela"),
        // Define uma cor de fundo diferente para identificar visualmente a tela.
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        width: double.infinity,
        color:
            Colors.yellow, // Cor de fundo amarela para destacar a segunda tela.
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Texto indicativo exibido ao center da segunda tela.
            const Text(
              "Você está na segunda tela",
              style: TextStyle(backgroundColor: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
