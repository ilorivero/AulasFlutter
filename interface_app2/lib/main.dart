import 'package:flutter/material.dart';
import 'CampoTexto.dart';         // Tela com exemplo de TextField
import 'EntradaCheckBox.dart';    // Tela com exemplo de CheckboxListTile
import 'EntradaRadioButton.dart'; // Tela com exemplo de RadioListTile
import 'EntradaSlider.dart';      // Tela com exemplo de Slider
import 'EntradaSwitch.dart';      // Tela com exemplo de SwitchListTile

/// Ponto de entrada do aplicativo de exemplos de widgets de entrada.
///
/// Exibe um menu principal com cards para cada tipo de widget demonstrado,
/// permitindo que o aluno navegue livremente entre os exemplos.
void main() {
  runApp(const MyApp());
}

/// Widget raiz do aplicativo.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widgets de Interface',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MenuPrincipal(),
    );
  }
}

/// Modelo de dados para cada item do menu de exemplos.
class _ExemploItem {
  /// Título exibido no card.
  final String titulo;

  /// Subtítulo com uma breve descrição do widget demonstrado.
  final String descricao;

  /// Ícone ilustrativo do widget.
  final IconData icone;

  /// Cor de destaque do card.
  final Color cor;

  /// Widget que será aberto ao pressionar o card.
  final Widget tela;

  const _ExemploItem({
    required this.titulo,
    required this.descricao,
    required this.icone,
    required this.cor,
    required this.tela,
  });
}

/// Tela principal com menu de navegação para todos os exemplos de widgets.
///
/// Apresenta um [GridView] com cards que levam a cada exemplo de widget
/// de entrada disponível no projeto.
class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  /// Lista de todos os exemplos disponíveis para navegação.
  static final List<_ExemploItem> _exemplos = [
    _ExemploItem(
      titulo: 'Campo de Texto',
      descricao: 'TextField com TextEditingController',
      icone: Icons.text_fields,
      cor: Colors.blue,
      tela: CampoTexto(),
    ),
    _ExemploItem(
      titulo: 'CheckBox',
      descricao: 'CheckboxListTile para seleção múltipla',
      icone: Icons.check_box,
      cor: Colors.green,
      tela: EntradaCheckBox(),
    ),
    _ExemploItem(
      titulo: 'RadioButton',
      descricao: 'RadioListTile para seleção única',
      icone: Icons.radio_button_checked,
      cor: Colors.orange,
      tela: EntradaRadioButton(),
    ),
    _ExemploItem(
      titulo: 'Slider',
      descricao: 'Controle deslizante com rótulo dinâmico',
      icone: Icons.tune,
      cor: Colors.red,
      tela: EntradaSlider(),
    ),
    _ExemploItem(
      titulo: 'Switch',
      descricao: 'SwitchListTile para opções on/off',
      icone: Icons.toggle_on,
      cor: Colors.purple,
      tela: EntradaSwitch(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets de Entrada'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabeçalho explicativo para o aluno.
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Selecione um exemplo abaixo para testar o widget correspondente:',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
            // Grid com os cards de exemplo.
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,       // 2 cards por linha
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.1,   // Proporção largura/altura do card
                ),
                itemCount: _exemplos.length,
                itemBuilder: (context, index) {
                  final exemplo = _exemplos[index];
                  return _ExemploCard(exemplo: exemplo);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Card individual do menu que navega para a tela do exemplo correspondente.
class _ExemploCard extends StatelessWidget {
  /// Dados do exemplo a ser exibido neste card.
  final _ExemploItem exemplo;

  const _ExemploCard({required this.exemplo});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        // Ao tocar no card, navega para a tela do exemplo usando Navigator.push.
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => exemplo.tela),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            // Gradiente de cor para identificar visualmente cada exemplo.
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                exemplo.cor.withOpacity(0.8),
                exemplo.cor.withOpacity(0.5),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Ícone representativo do widget.
                Icon(exemplo.icone, size: 48, color: Colors.white),
                const SizedBox(height: 8),
                // Título do exemplo.
                Text(
                  exemplo.titulo,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                // Breve descrição do widget.
                Text(
                  exemplo.descricao,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
