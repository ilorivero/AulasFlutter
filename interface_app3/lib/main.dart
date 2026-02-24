import 'package:flutter/material.dart';
import 'PrimeiraTela.dart'; // Tela inicial do fluxo de navegação

/// Ponto de entrada do aplicativo de demonstração de navegação entre telas.
///
/// O [MaterialApp] define a estrutura base do aplicativo e [PrimeiraTela]
/// é configurada como a tela inicial (home).
void main() {
  runApp(MaterialApp(home: PrimeiraTela()));
}
