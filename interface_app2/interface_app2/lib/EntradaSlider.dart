import 'package:flutter/material.dart';

/// Widget de tela para demonstrar o uso do widget [Slider].
///
/// Exibe um controle deslizante de satisfação de 0 a 100, com rótulo
/// dinâmico e divisões de 10 em 10.
class EntradaSlider extends StatefulWidget {
  @override
  _EntradaSliderState createState() => _EntradaSliderState();
}

/// Estado associado ao widget [EntradaSlider].
class _EntradaSliderState extends State<EntradaSlider> {
  /// Valor atual do slider, inicializado em 50 (posição central).
  double valor = 50;

  /// Rótulo exibido na bolha do slider ao ser arrastado.
  String label = "seleção";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Satisfação dos clientes")),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            Slider(
              value: valor, // Valor atual da posição do slider.
              min: 0, // Valor mínimo do slider.
              max: 100, // Valor máximo do slider.
              label: label, // Texto exibido acima do slider ao arrastar.
              divisions: 10, // Divide o intervalo em 10 partes discretas.
              activeColor: Colors.red, // Cor da parte ativa (esquerda).
              inactiveColor: Colors.black12, // Cor da parte inativa (direita).
              onChanged: (double novoValor) {
                // Atualiza o valor e o rótulo a cada vez que o slider é movido.
                setState(() {
                  valor = novoValor;
                  label = "seleção: " + novoValor.toString();
                });
              },
            ),
            // Botão para confirmar e salvar o valor selecionado.
            ElevatedButton(
              child: const Text("Salvar", style: TextStyle(fontSize: 20)),
              onPressed: () {
                print("Valor salvo: " + valor.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
