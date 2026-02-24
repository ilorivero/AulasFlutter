import 'package:shared_preferences/shared_preferences.dart'; // Pacote para persistência de dados
import 'package:flutter/material.dart';

/// Tela principal que demonstra o uso da API moderna [SharedPreferencesAsync]
/// para persistência de dados simples de forma local.
///
/// Note que [SharedPreferences] foi marcado como depreciado em versões recentes.
/// Esta implementação usa [SharedPreferencesAsync], que é a API recomendada.
/// Existe também o [SharedPreferencesCached] para leituras sem await.
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

/// Estado associado ao widget [Home].
class _HomeState extends State<Home> {
  /// Texto exibido na tela com o valor recuperado do armazenamento local.
  String _textoSalvo = "Nada salvo!";

  /// Controlador para capturar o texto digitado pelo usuário.
  final TextEditingController _textController = TextEditingController();

  /// Salva o texto digitado no armazenamento local usando [SharedPreferencesAsync].
  ///
  /// O método é assíncrono pois o [SharedPreferencesAsync] não usa cache interno;
  /// cada operação vai diretamente ao armazenamento persistente.
  _salvarDados() async {
    String valorDigitado = _textController.text;
    // Cria uma instância de SharedPreferencesAsync (API moderna, sem cache).
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    // Salva o texto com a chave "nome". A chave é usada para recuperar o valor.
    await prefs.setString("nome", valorDigitado);
    print("Operação salvar: $valorDigitado");
  }

  /// Recupera o texto salvo anteriormente e atualiza a interface do usuário.
  ///
  /// Usa o operador '??' para fornecer um valor padrão caso não haja dado salvo.
  _recuperarDados() async {
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    // getString pode retornar null se a chave não existir.
    final String? _textoRecuperado = await prefs.getString("nome");
    // setState redesenha o widget com o novo valor da variável _textoSalvo.
    setState(() {
      _textoSalvo = _textoRecuperado ?? "Sem valor";
    });
    print("Operação recuperar: $_textoSalvo");
  }

  /// Remove o dado associado à chave "nome" do armazenamento local.
  _removerDados() async {
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
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
            // Campo de texto para o usuário digitar o nome a ser salvo.
            TextField(
              decoration: const InputDecoration(labelText: "Digite o nome: "),
              controller: _textController,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Botão para acionar a operação de salvar.
                ElevatedButton(
                  onPressed: _salvarDados,
                  child: const Text("Salvar"),
                ),
                const SizedBox(width: 16),
                // Botão para acionar a operação de recuperar.
                ElevatedButton(
                  onPressed: _recuperarDados,
                  child: const Text("Recuperar"),
                ),
                const SizedBox(width: 16),
                // Botão para acionar a operação de remover.
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
                // Exibe o valor recuperado do armazenamento local.
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
