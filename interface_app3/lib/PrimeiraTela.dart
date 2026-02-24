import 'package:flutter/material.dart';
import 'SegundaTela.dart'; // Importação da segunda tela de navegação

/// Primeira tela do aplicativo de demonstração de navegação entre telas.
///
/// Exibe um botão que navega para a [SegundaTela] usando [Navigator.push],
/// demonstrando o padrão de navegação com pilha de rotas do Flutter.
class PrimeiraTela extends StatefulWidget {
  @override
  _PrimeiraTelaState createState() => _PrimeiraTelaState();
}

/// Estado associado ao widget [PrimeiraTela].
class _PrimeiraTelaState extends State<PrimeiraTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Primeira Tela")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Ir para Segunda Tela"),
          // Navigator.push empilha a nova rota sobre a rota atual.
          // O botão "voltar" gerado pela AppBar da segunda tela
          // chamará Navigator.pop para retornar a esta tela.
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SegundaTela()),
            );
          },
        ),
      ),
    );
  }
}
