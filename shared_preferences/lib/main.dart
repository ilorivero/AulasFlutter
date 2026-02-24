import 'package:flutter/material.dart';
import 'Home.dart'; // Tela principal com operações de SharedPreferencesAsync

/// Ponto de entrada do aplicativo de demonstração de SharedPreferencesAsync.
///
/// O [MaterialApp] inicializa o app com [Home] como a tela inicial,
/// removendo o banner de debug.
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}
