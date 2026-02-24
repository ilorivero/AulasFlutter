import 'package:flutter/material.dart';

/// Widget de tela que demonstra CheckboxListTile para uma lista de compras.
///
/// O usuário pode marcar os itens que deseja comprar e confirmar a seleção
/// ao pressionar o botão "Salvar".
class EntradaCheckBox extends StatefulWidget {
  @override
  _EntradaCheckBoxState createState() => _EntradaCheckBoxState();
}

/// Estado associado ao widget [EntradaCheckBox].
class _EntradaCheckBoxState extends State<EntradaCheckBox> {
  /// Indica se o item "Arroz" está selecionado na lista de compras.
  bool _arroz = false;

  /// Indica se o item "Feijão" está selecionado na lista de compras.
  bool _feijao = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de compras")),
      body: Container(
        child: Column(
          children: <Widget>[
            // Checkbox para o item Arroz com ícone ilustrativo.
            CheckboxListTile(
              title: const Text("Arroz"),
              secondary: const Icon(Icons.local_grocery_store),
              value: _arroz,
              onChanged: (bool? valor) {
                // Atualiza o estado do checkbox. O valor pode ser null em modo tristate.
                setState(() {
                  _arroz = valor ?? false;
                });
              },
            ),
            // Checkbox para o item Feijão com ícone ilustrativo.
            CheckboxListTile(
              title: const Text("Feijão"),
              secondary: const Icon(Icons.local_grocery_store),
              value: _feijao,
              onChanged: (bool? valor) {
                // Atualiza o estado do checkbox.
                setState(() {
                  _feijao = valor ?? false;
                });
              },
            ),
            // Botão para confirmar e exibir os itens selecionados no console.
            ElevatedButton(
              child: const Text("Salvar"),
              onPressed: () {
                if (_arroz) print("Comprar: Arroz");
                if (_feijao) print("Comprar: Feijão");
              },
            ),
          ],
        ),
      ),
    );
  }
}
