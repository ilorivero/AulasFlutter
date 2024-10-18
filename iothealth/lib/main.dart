import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IoT Health',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const InitialPage(title: 'IoT Health Flutter'),
    );
  }
}

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  String usuario = "40:4C:CA:56:AD:C4";
  late DatabaseReference _dados;
  late StreamSubscription<DatabaseEvent> _dadosSubscription;

  String temperaturaAmbiente = "N/A";
  String temperaturaPessoa = "N/A";
  String timestamp = "N/A";
  String umidade = "N/A";
  bool ledState = false;

  @override
  void initState() {
    super.initState();
    _loadUsuario();
  }

  Future<void> _loadUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      usuario = prefs.getString('usuario') ?? "40:4C:CA:56:AD:C4";
    });
    init();
  }

  Future<void> _saveUsuario(String macAddress) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('usuario', macAddress);
    setState(() {
      usuario = macAddress;
    });
    init();
  }

  Future<void> init() async {
    _dados = FirebaseDatabase.instance.ref(usuario);

    _dadosSubscription = _dados.onValue.listen(
          (DatabaseEvent event) {
        final data = event.snapshot.value as Map<dynamic, dynamic>;
        setState(() {
          temperaturaAmbiente = data['temperaturaAmbiente'].toString();
          temperaturaPessoa = data['temperaturaPessoa'].toString();
          timestamp = data['timestamp'].toString();
          umidade = data['umidade'].toString();
        });
      },
      onError: (Object o) {
        final error = o as FirebaseException;
        print('Error: ${error.code} ${error.message}');
      },
    );
  }

  void toggleLed() {
    setState(() {
      ledState = !ledState;
      _dados.child('led').set(ledState ? 1 : 0);
    });
  }

  @override
  void dispose() {
    _dadosSubscription.cancel();
    super.dispose();
  }

  void _showMacAddressDialog() {
    final TextEditingController macController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cadastrar Endereço MAC'),
          content: TextField(
            controller: macController,
            decoration: const InputDecoration(hintText: "Digite o endereço MAC"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Salvar'),
              onPressed: () {
                _saveUsuario(macController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: _showMacAddressDialog,
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildDataCard('Temperatura Ambiente', temperaturaAmbiente, Icons.thermostat),
              buildDataCard('Temperatura Pessoal', temperaturaPessoa, Icons.person),
              buildDataCard('Timestamp', timestamp, Icons.access_time),
              buildDataCard('Umidade', umidade, Icons.water_drop),
              ElevatedButton(
                onPressed: toggleLed,
                child: Text(ledState ? 'Desligar LED' : 'Ligar LED'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ledState ? Colors.red : Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDataCard(String label, String value, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: Colors.teal, size: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  value,
                  style: const TextStyle(fontSize: 24, color: Colors.teal),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
