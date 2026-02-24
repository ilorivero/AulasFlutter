import 'package:flutter/material.dart';

/// Widget de tela para demonstrar o uso do widget [SwitchListTile].
///
/// Exibe interruptores (switches) para ativar ou desativar notificações
/// de diferentes aplicativos, salvando a escolha ao pressionar o botão.
class EntradaSwitch extends StatefulWidget {
  @override
  _EntradaSwitchState createState() => _EntradaSwitchState();
}

/// Estado associado ao widget [EntradaSwitch].
class _EntradaSwitchState extends State<EntradaSwitch> {
  /// Controla o estado da notificação do Gmail (true = ativado).
  bool _gmail = false;

  /// Controla o estado da notificação do WhatsApp (true = ativado).
  bool _whatsapp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notificações")),
      body: Container(
        child: Column(
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(16)),
            // Switch para ativar/desativar notificações do Gmail.
            SwitchListTile(
              activeColor: Colors.red,
              title: const Text("Gmail: "),
              value: _gmail,
              onChanged: (bool valor) {
                // Atualiza o estado do switch ao ser alterado.
                setState(() {
                  _gmail = valor;
                });
              },
            ),
            // Switch para ativar/desativar notificações do WhatsApp.
            SwitchListTile(
              activeColor: Colors.red,
              title: const Text("WhatsApp: "),
              value: _whatsapp,
              onChanged: (bool valor) {
                // Atualiza o estado do switch ao ser alterado.
                setState(() {
                  _whatsapp = valor;
                });
              },
            ),
            // Botão para confirmar e imprimir as escolhas feitas.
            ElevatedButton(
              child: const Text("Salvar"),
              onPressed: () {
                // Imprime o estado de cada notificação no console.
                if (_gmail)
                  print("Escolha: ativar Gmail");
                else
                  print("Escolha: desativar Gmail");
                if (_whatsapp)
                  print("Escolha: ativar WhatsApp");
                else
                  print("Escolha: desativar WhatsApp");
              },
            ),
          ],
        ),
      ),
    );
  }
}
