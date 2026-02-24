import 'package:shared_preferences/shared_preferences.dart'; // Pacote para persistência de dados simples
import 'package:flutter/material.dart';

/// Tela principal que demonstra o uso de [SharedPreferences] para
/// salvar, recuperar e remover dados simples de forma persistente.
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

/// Estado associado ao widget [Home].
class _HomeState extends State<Home> {
  /// Armazena o texto recuperado do armazenamento local para exibição na tela.
  String _textoSalvo = "Nada salvo!";

  /// Controlador para obter o texto digitado pelo usuário no [TextField].
  final TextEditingController _textController = TextEditingController();

  /// Salva o texto digitado no campo de entrada usando [SharedPreferences].
  ///
  /// O método é assíncrono, pois a operação de escrita em disco não é instantânea.
  /// A chave "nome" é usada para identificar o dado salvo.
  _salvarDados() async {
    String valorDigitado = _textController.text;
    // Obtém a instância do SharedPreferences para o armazenamento local.
    final prefs = await SharedPreferences.getInstance();
    // Salva o texto com a chave "nome". A chave é usada para recuperar o valor depois.
    await prefs.setString("nome", valorDigitado);
    print("Operação salvar: $valorDigitado");
  }

  /// Recupera o texto salvo anteriormente usando a chave "nome".
  ///
  /// Atualiza o estado da tela com o valor recuperado. Se não houver valor
  /// salvo, exibe "Sem valor" como padrão.
  _recuperarDados() async {
    final prefs = await SharedPreferences.getInstance();
    // O operador '??' retorna "Sem valor" caso o getString retorne null.
    setState(() {
      _textoSalvo = prefs.getString("nome") ?? "Sem valor";
    });
    print("Operação recuperar: $_textoSalvo");
  }

  /// Remove o valor associado à chave "nome" do armazenamento local.
  _removerDados() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("nome");
    print("Operação remover");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Persistência de dados")),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            // Campo de texto onde o usuário digita o nome a ser salvo.
            TextField(
              decoration: const InputDecoration(labelText: "Digite o nome: "),
              controller: _textController,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Botão que aciona o salvamento dos dados.
                ElevatedButton(
                  onPressed: _salvarDados,
                  child: const Text("Salvar"),
                ),
                const SizedBox(width: 16),
                // Botão que aciona a recuperação dos dados.
                ElevatedButton(
                  onPressed: _recuperarDados,
                  child: const Text("Recuperar"),
                ),
                const SizedBox(width: 16),
                // Botão que aciona a remoção dos dados.
                ElevatedButton(
                  onPressed: _removerDados,
                  child: const Text("Remover"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(padding: EdgeInsets.only(top: 100)),
                // Exibe o texto recuperado do armazenamento local.
                Text(
                  _textoSalvo,
                  style: const TextStyle(fontSize: 20, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
