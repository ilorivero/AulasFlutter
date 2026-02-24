import 'package:flutter/material.dart';

/// Widget de tela para demonstrar o uso do [RadioListTile].
///
/// Exibe uma pesquisa de satisfação com opções de resposta exclusivas
/// (apenas uma pode ser selecionada por vez — comportamento padrão do RadioButton).
class EntradaRadioButton extends StatefulWidget {
  @override
  _EntradaRadioButtonState createState() => _EntradaRadioButtonState();
}

/// Estado associado ao widget [EntradaRadioButton].
class _EntradaRadioButtonState extends State<EntradaRadioButton> {
  /// Variável que armazena o valor do botão de rádio selecionado pelo usuário.
  /// Inicializada com string vazia para garantir a segurança de nulidade (null safety).
  String _selecionado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pesquisa de Satisfação")),
      body: Container(
        child: Column(
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(16)),
            const Text("Satisfeito com o produto? "),
            // Opção "Sim" — quando selecionada, _selecionado recebe "sim".
            RadioListTile<String>(
              title: const Text("Sim"),
              value: "sim",
              groupValue: _selecionado, // Controla qual radio está marcado.
              onChanged: (String? escolha) {
                setState(() {
                  _selecionado = escolha ?? '';
                });
              },
            ),
            // Opção "Não" — quando selecionada, _selecionado recebe "nao".
            RadioListTile<String>(
              title: const Text("Não"),
              value: "nao",
              groupValue: _selecionado,
              onChanged: (String? escolha) {
                setState(() {
                  _selecionado = escolha ?? '';
                });
              },
            ),
            // Botão para confirmar e imprimir a opção selecionada.
            ElevatedButton(
              child: const Text("Salvar"),
              onPressed: () {
                print("Item selecionado: " + _selecionado);
              },
            ),
          ],
        ),
      ),
    );
  }
}
