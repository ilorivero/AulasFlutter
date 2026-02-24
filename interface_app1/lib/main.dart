import 'package:flutter/material.dart';

/// Ponto de entrada do aplicativo de demonstração de interface.
///
/// Usa a notação de expressão (=>) pois o corpo da função tem uma única linha.
void main() => runApp(MyApp());

/// Widget raiz do aplicativo.
///
/// [StatelessWidget] é usado porque o widget raiz geralmente não precisa
/// gerenciar estado próprio.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialApp define a estrutura base do aplicativo com suporte ao Material Design.
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove a faixa "DEBUG" da tela.
      theme: ThemeData(
          primaryColor: Colors.blue), // Define a cor primária do tema.
      home: HomePage(),
    );
  }
}

/// Tela principal do aplicativo com uma galeria de imagens.
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cães Bonitinhos"),
        centerTitle: true, // Centraliza o título na AppBar.
      ),
      // O body exibe uma imagem que ocupa toda a tela.
      body: _img(),
    );
  }

  /// Cria um widget de Container centralizado com um botão (não usado nesta versão).
  _body() {
    return Container(
      color: Colors.white,
      child: Center(
        child: _button(),
      ),
    );
  }

  /// Cria um [ElevatedButton] estilizado com cores e tamanhos personalizados (não usado nesta versão).
  _button() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.purple,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle:
                const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        child: const Text(
          "Ok",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () => print("Clicou no botão ok!"));
  }

  /// Exibe uma imagem a partir dos assets do projeto.
  ///
  /// [BoxFit.cover] garante que a imagem cubra o espaço disponível,
  /// podendo cortar as bordas se necessário.
  _img() {
    return Image.asset(
      "assets/images/cao.jpeg",
      fit: BoxFit.cover,
    );
  }

  /// Cria um [Text] estilizado com cor, tamanho e decoração (não usado nesta versão).
  _text() {
    return const Text(
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
